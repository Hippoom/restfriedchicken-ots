package com.restfriedchicken.ots.rest;

public class OnlineTxnResourceAcceptanceTest extends OnlineTxnResourceTestTemplate {
    @Override
    protected String getBaseUri() {
        return "http://192.168.60.2";
    }

    @Override
    protected int getPort() {
        return 8080;
    }

}
