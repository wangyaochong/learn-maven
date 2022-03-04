package com.example.learnpackage;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class TestComponent implements InitializingBean {
    @Value("${application.base}")
    String applicationBase;
    @Value("${application.key}")
    String applicationKey;
    @Value("${bootstrap.base}")
    String bootstrapBase;
    @Value("${bootstrap.key}")
    String bootstrapKey;


    @Override public void afterPropertiesSet() throws Exception {
        log.info("applicationBase={}", applicationBase);
        log.info("applicationKey={}", applicationKey);
        log.info("bootstrapBase={}", bootstrapBase);
        log.info("bootstrapKey={}", bootstrapKey);
    }
}
