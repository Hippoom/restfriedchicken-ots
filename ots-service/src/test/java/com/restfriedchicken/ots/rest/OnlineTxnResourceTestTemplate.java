package com.restfriedchicken.ots.rest;

import com.jayway.restassured.RestAssured;
import com.jayway.restassured.response.Response;
import org.junit.Before;
import org.junit.Test;

import static com.google.common.base.Joiner.on;
import static com.jayway.restassured.RestAssured.given;
import static com.jayway.restassured.http.ContentType.JSON;
import static com.restfriedchicken.ots.rest.HateoasUtils.selfLinkOf;
import static java.lang.String.format;
import static org.apache.http.HttpStatus.SC_ACCEPTED;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.startsWith;

/**
 * Created by twer on 12/9/14.
 */
public abstract class OnlineTxnResourceTestTemplate {
    @Before
    public void config_rest_assured() {
        RestAssured.baseURI = getBaseUri();
        RestAssured.port = getPort();
    }


    @Test
    public void should_returns_status_code_with_accepted_and_self_link() throws Exception {

        final String command = json(field("orderId", "123456"), field("amount", "10"));

        Response response = given().contentType(JSON).content(command).
                when().
                post("/online-txn").
                then().log().everything().
                statusCode(SC_ACCEPTED)
                .extract().response();

        String json = response.asString();

        assertThat(selfLinkOf(json).get(),
                startsWith(format(getResourceUri() + "/online-txn", getPort())));
    }

    private String getResourceUri() {
        return getBaseUri() + ":" + getPort();
    }

    private String field(String key, String field) {
        return format("\"%s\":\"%s\"", key, field);
    }

    private String json(final String... fields) {
        return format("{%s}", on(",").join(fields));
    }
    abstract protected String getBaseUri();

    abstract protected int getPort();
}
