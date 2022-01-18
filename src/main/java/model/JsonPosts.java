/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;
import org.json.*;

/**
 *
 * @author gerencia
 */
public class JsonPosts {
    private String counterPostsStr;
    private String from;
    private Timestamp dateSend;
    private int selectPosts;
    private String textPosts;
    
    JSONObject posts = new JSONObject();
    JSONObject historyPosts = new JSONObject();
    
    public JSONObject posts(String from, Timestamp dateSend, int selectPosts, String textPosts){
        this.from = from;
        this.dateSend = dateSend;
        this.selectPosts = selectPosts;
        this.textPosts = textPosts;
        
        posts.put("Enviado por", from);
        posts.put("Fecha", dateSend);
        posts.put("Revisar", selectPosts);
        posts.put("Mensaje", textPosts);
        
        return posts;
    }
    
    public JSONObject historyPosts(String counterPostsStr, JSONObject posts){
        this.counterPostsStr = counterPostsStr;
        
        historyPosts.put(counterPostsStr, posts);
        
        return historyPosts;
    }
}


