/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import jakarta.websocket.OnClose;
import jakarta.websocket.OnError;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.PathParam;
import jakarta.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 *
 * @author Asus
 */
@ServerEndpoint(value = "/messageListAccount/{roomId}")
public class ChatEndpoint {
     private static final ConcurrentHashMap<String, Set<Session>> roomSessions = new ConcurrentHashMap<>();

    @OnOpen
    public void onOpen(Session session, @PathParam("roomId") String roomId) {
        // add session cho 1 room mới
        roomSessions.computeIfAbsent(roomId, k -> ConcurrentHashMap.newKeySet()).add(session);
    }

    @OnMessage
public void onMessage(String message, @PathParam("roomId") String roomId, Session clientSession) throws IOException {
    Set<Session> sessions = roomSessions.get(roomId);
    if (sessions != null) {
        for (Session session : sessions) {
            if (session.isOpen() && !session.equals(clientSession)) { // Kiểm tra xem session có phải là của người gửi hay không tức gửi cho người khác chứ không phải gửi cho chính mình
                //get basic truyen tin nhan tu xa theo dang session 
                // sendText là ws.send muc dich la truyen tin nhan sang session do 
                // clientSession 
                session.getBasicRemote().sendText(message);
            }
        }
    }
}

    @OnClose
    public void onClose(Session session, @PathParam("roomId") String roomId) {
        Set<Session> sessions = roomSessions.get(roomId);
        if (sessions != null) {
            sessions.remove(session);
        }
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        // Handle error
    }
}
