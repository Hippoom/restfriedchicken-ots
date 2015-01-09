package com.restfriedchicken.ots.config;

import lombok.Data;

@Data
public class EnvironmentConfig {

    private String baseUri;

    private int port = 8080;
}
