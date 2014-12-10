package com.restfriedchicken.ots.rest;

import com.jayway.restassured.RestAssured;
import com.restfriedchicken.ots.Application;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.IntegrationTest;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = Application.class)
@WebAppConfiguration
@IntegrationTest("server.port:0")//random port used
public class OnlineTxnResourceIntegrationTest extends OnlineTxnResourceTestTemplate {
    @Value("${local.server.port}")
    private int port;

    @Override
    protected String getBaseUri() {
        return RestAssured.DEFAULT_URI;
    }

    @Override
    protected int getPort() {
        return port;
    }

}
