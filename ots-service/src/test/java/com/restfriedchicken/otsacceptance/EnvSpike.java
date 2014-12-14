package com.restfriedchicken.otsacceptance;

import org.junit.Test;

public class EnvSpike {

    @Test
    public void should_access_env_var() {
        System.out.println("------------" + System.getenv("env"));
    }
}
