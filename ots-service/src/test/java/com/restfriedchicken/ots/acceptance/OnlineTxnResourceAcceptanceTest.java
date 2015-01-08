package com.restfriedchicken.ots.acceptance;

import com.jayway.jsonpath.JsonPath;
import com.restfriedchicken.ots.config.EnvironmentConfig;
import com.restfriedchicken.ots.rest.OnlineTxnResourceTestTemplate;
import org.apache.commons.lang3.StringUtils;
import org.junit.runner.RunWith;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.FileSystemResource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.AnnotationConfigContextLoader;

import java.io.File;
import java.io.IOException;

import static java.lang.String.format;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(loader = AnnotationConfigContextLoader.class)
public class OnlineTxnResourceAcceptanceTest extends OnlineTxnResourceTestTemplate {

    @Configuration
    static class ContextConfiguration implements ApplicationContextAware {

        private ApplicationContext applicationContext;

        @Bean
        public EnvironmentConfig config() throws IOException {
            EnvironmentConfig config = new EnvironmentConfig();

            FileSystemResource build = new FileSystemResource("build.gradle");

            final File json = build.createRelative("../ots-env/" + env() + ".json").getFile().getAbsoluteFile();

            String baseHostRel = JsonPath.read(json, "$.ots-services.vars.ots_service_base_host_rel");

            if (StringUtils.isNotBlank(baseHostRel)) {
                config.setBaseUri("http://" + JsonPath.<String>read(json, format("$.ots-services.%s.host", baseHostRel)));
            }

            String port = JsonPath.read(json, format("$.ots-services.%s.ots_service_port", baseHostRel));
            if (StringUtils.isNotBlank(port)) {
                config.setPort(Integer.parseInt(port));
            }
            return config;
        }

        private String env() {
            final String env = System.getenv("OTS_ENV");
            return env == null ? "dev" : env;
        }

        @Override
        public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
            this.applicationContext = applicationContext;
        }
    }

    @Autowired
    private EnvironmentConfig config;

    @Override
    protected String getBaseUri() {
        return config.getBaseUri();
    }

    @Override
    protected int getPort() {
        return config.getPort();
    }

}
