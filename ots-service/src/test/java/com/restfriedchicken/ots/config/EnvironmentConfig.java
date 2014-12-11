package com.restfriedchicken.ots.config;


public class EnvironmentConfig {

    private String baseUri;

    public void setBaseUri(String baseUri) {
        this.baseUri = baseUri;
    }

    public String getBaseUri() {
        return baseUri;
    }

    public int getPort() {
        return 8080;
    }
}
