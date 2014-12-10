package com.restfriedchicken.ots.rest;

import org.junit.Test;

import static com.restfriedchicken.ots.rest.HateoasUtils.selfLinkOf;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.equalTo;

public class HateoasUtilsTest {


    @Test
    public void should_return_self_ref() {
        final String json = "{" +
                "\"links\": [" +
                "{" +
                "\"rel\": \"self\"," +
                "\"href\": \"http://localhost:50733/online-txn\"" +
                "}" +
                "]" +
                "}";

        assertThat(selfLinkOf(json).get(), equalTo("http://localhost:50733/online-txn"));
    }

}
