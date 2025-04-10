package cn.corneliamo.stirredsouls.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.relational.core.dialect.Dialect;

@Configuration
public class JdbcDialectConfig {

    @Bean
    public Dialect jdbcDialect() {
        return SqliteDialect.INSTANCE;
    }
}
