package com.framework.cmm.configuration;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@MapperScan(value = "com.framework.cmm.mapper2", sqlSessionFactoryRef = "secondSqlSessionFactory")
public class SecondDatabaseConfiguration {
	
	@Value("${server.mode}")
	private String mode;
	
	@Value("${dev.spring.second.datasource.hikari.driver-class-name}")
	private String devDriverClassName;

	@Value("${dev.spring.second.datasource.hikari.jdbc-url}")
	private String devJdbcUrl;

	@Value("${dev.spring.second.datasource.hikari.username}")
	private String devUsername;

	@Value("${dev.spring.second.datasource.hikari.password}")
	private String devPassword;

	@Value("${dev.spring.second.datasource.hikari.connection-test-query}")
	private String devConnectionTestQuery;
	
	@Value("${stg.spring.second.datasource.hikari.driver-class-name}")
	private String stgDriverClassName;

	@Value("${stg.spring.second.datasource.hikari.jdbc-url}")
	private String stgJdbcUrl;

	@Value("${stg.spring.second.datasource.hikari.username}")
	private String stgUsername;

	@Value("${stg.spring.second.datasource.hikari.password}")
	private String stgPassword;

	@Value("${stg.spring.second.datasource.hikari.connection-test-query}")
	private String stgConnectionTestQuery;
	
	@Value("${prd.spring.second.datasource.hikari.driver-class-name}")
	private String prdDriverClassName;

	@Value("${prd.spring.second.datasource.hikari.jdbc-url}")
	private String prdJdbcUrl;

	@Value("${prd.spring.second.datasource.hikari.username}")
	private String prdUsername;

	@Value("${prd.spring.second.datasource.hikari.password}")
	private String prdPassword;

	@Value("${prd.spring.second.datasource.hikari.connection-test-query}")
	private String prdConnectionTestQuery;
	
	@Autowired
	private ApplicationContext applicationContext;
	
	@Bean
	public HikariConfig secondHikariConfig() throws Exception {
		HikariConfig hikariConfig = new HikariConfig();
		if("DEV".equals(mode)) {
			hikariConfig.setDriverClassName(devDriverClassName);
			hikariConfig.setJdbcUrl(devJdbcUrl);
			hikariConfig.setUsername(devUsername);
			hikariConfig.setPassword(devPassword);
			hikariConfig.setConnectionTestQuery(devConnectionTestQuery);
		} else if ("STG".equals(mode)) {
			hikariConfig.setDriverClassName(stgDriverClassName);
			hikariConfig.setJdbcUrl(stgJdbcUrl);
			hikariConfig.setUsername(stgUsername);
			hikariConfig.setPassword(stgPassword);
			hikariConfig.setConnectionTestQuery(stgConnectionTestQuery);
		} else if ("PRD".equals(mode)) {
			hikariConfig.setDriverClassName(prdDriverClassName);
			hikariConfig.setJdbcUrl(prdJdbcUrl);
			hikariConfig.setUsername(prdUsername);
			hikariConfig.setPassword(prdPassword);
			hikariConfig.setConnectionTestQuery(prdConnectionTestQuery);
		}

		return hikariConfig;
	}
	
	@Bean
	public org.apache.ibatis.session.Configuration secondMybatisConfig(){
		return new org.apache.ibatis.session.Configuration(); 
	}
	
	@Bean
	public DataSource secondDataSource() throws Exception{
		DataSource dataSource = new HikariDataSource(secondHikariConfig());
		return dataSource;
	}
	
	@Bean
	public SqlSessionFactory secondSqlSessionFactory(DataSource dataSource) throws Exception{
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(dataSource);
		sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:/mapper2/**/sql-*.xml"));
		sqlSessionFactoryBean.setConfiguration(secondMybatisConfig());
		
		return sqlSessionFactoryBean.getObject();
	}
	
	@Bean
	public SqlSessionTemplate secondSqlSessionTemplate(SqlSessionFactory sqlSessionFactory){
		return new SqlSessionTemplate(sqlSessionFactory);
	}
	
}
