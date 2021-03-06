
create database TT;
-- c_orders

CREATE TABLE c_orders(
    o_id VARCHAR(30) NOT NULL UNIQUE COMMENT '订单ID',
    app_id VARCHAR(10) NOT NULL COMMENT '应用ID',
    ext_transaction_id VARCHAR(36) NOT NULL COMMENT '外部交易流水',
    user_id VARCHAR(30) NOT NULL COMMENT '用户ID',
    request_time VARCHAR(16) NOT NULL COMMENT '外部系统请求时间',
    create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    order_type_cd VARCHAR(4) NOT NULL COMMENT '订单类型，参考c_order_type表',
    finish_time DATE COMMENT '订单完成时间',
    remark VARCHAR(200) COMMENT '备注',
    status_cd VARCHAR(2) NOT NULL COMMENT '数据状态，详细参考c_status表'
);

-- c_orders_attrs

CREATE TABLE c_orders_attrs(
    o_id VARCHAR(30) NOT NULL COMMENT '订单ID',
    attr_id VARCHAR(30) NOT NULL COMMENT '属性id',
    spec_cd VARCHAR(12) NOT NULL COMMENT '规格id,参考spec表',
    `value` VARCHAR(50) NOT NULL COMMENT '属性值'
);



-- c_business

CREATE TABLE c_business(
    b_id VARCHAR(30) NOT NULL UNIQUE COMMENT '业务Id',
    o_id VARCHAR(30) NOT NULL COMMENT '订单ID',
    create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    business_type_cd VARCHAR(12) NOT NULL COMMENT '业务项类型，参考c_business_type表',
    finish_time DATE COMMENT '完成时间',
    remark VARCHAR(200) COMMENT '备注',
    status_cd VARCHAR(2) NOT NULL COMMENT '数据状态，详细参考c_status表'
);

--c_orders_attrs

CREATE TABLE c_business_attrs(
    b_id VARCHAR(30) NOT NULL COMMENT '订单ID',
    attr_id VARCHAR(30) NOT NULL COMMENT '属性id',
    spec_cd VARCHAR(12) NOT NULL COMMENT '规格id,参考spec表',
    `value` VARCHAR(50) NOT NULL COMMENT '属性值'
);

-- c_status

CREATE TABLE c_status(
    id INT NOT NULL AUTO_INCREMENT KEY COMMENT 'id',
    status_cd VARCHAR(4) NOT NULL UNIQUE COMMENT '状态',
    `name` VARCHAR(50) NOT NULL COMMENT '名称',
    description VARCHAR(200) COMMENT '描述',
    create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
);

INSERT INTO c_status(status_cd,NAME,description) VALUES('1','无效的，不在用的','无效的，不在用的');
INSERT INTO c_status(status_cd,NAME,description) VALUES('0','有效的，在用的','有效的，在用的');
INSERT INTO c_status(status_cd,NAME,description) VALUES('S','保存成功','保存成功');
INSERT INTO c_status(status_cd,NAME,description) VALUES('D','作废订单','作废订单');
INSERT INTO c_status(status_cd,NAME,description) VALUES('E','错误订单','错误订单');
INSERT INTO c_status(status_cd,NAME,description) VALUES('NE','通知错误订单','通知错误订单');
INSERT INTO c_status(status_cd,NAME,description) VALUES('C','订单完成','订单完成');
INSERT INTO c_status(status_cd,NAME,description) VALUES('B','Business过程','Business过程');
INSERT INTO c_status(status_cd,NAME,description) VALUES('I','Instance过程','Instance过程')


--c_order_type

CREATE TABLE c_order_type(
    id INT NOT NULL AUTO_INCREMENT KEY COMMENT 'id',
    order_type_cd VARCHAR(4) NOT NULL UNIQUE COMMENT '订单类型',
    `name` VARCHAR(50) NOT NULL COMMENT '名称',
    description VARCHAR(200) COMMENT '描述',
    create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
);




-- c_business_type

CREATE TABLE c_business_type(
    id INT NOT NULL AUTO_INCREMENT KEY COMMENT 'id',
    business_type_cd VARCHAR(12) NOT NULL UNIQUE COMMENT '业务项类型',
    `name` VARCHAR(50) NOT NULL COMMENT '名称',
    description VARCHAR(200) COMMENT '描述',
    create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    UNIQUE KEY (business_type_cd)
);

insert into c_business_type(business_type_cd,name,description) values('DO','撤单','作废订单');
insert into c_business_type(business_type_cd,name,description) values('100100030001','保存用户信息','保存用户信息');
insert into c_business_type(business_type_cd,name,description) values('100100030002','保存用户地址信息','保存用户地址信息');
insert into c_business_type(business_type_cd,name,description) values('100100030003','用户打标','用户打标');
insert into c_business_type(business_type_cd,name,description) values('100100030004','用户证件','保存用户地址信息');
insert into c_business_type(business_type_cd,name,description) values('100100040001','修改用户信息','修改用户信息');
insert into c_business_type(business_type_cd,name,description) values('100100040002','停用用户信息','停用用户信息');
insert into c_business_type(business_type_cd,name,description) values('100100040003','恢复用户信息','恢复用户信息');
insert into c_business_type(business_type_cd,name,description) values('200100030001','保存商户信息','保存商户信息');
insert into c_business_type(business_type_cd,name,description) values('200100030002','商户成员加入信息','商户成员加入信息');
insert into c_business_type(business_type_cd,name,description) values('200100040001','修改商户信息','修改商户信息');
insert into c_business_type(business_type_cd,name,description) values('200100040002','商户成员退出信息','商户成员退出信息');
insert into c_business_type(business_type_cd,name,description) values('200100050001','删除商户信息','删除商户信息');
insert into c_business_type(business_type_cd,name,description) values('300100030001','保存商品信息','保存商品信息');
insert into c_business_type(business_type_cd,name,description) values('300100030002','购买商品','购买商品');
insert into c_business_type(business_type_cd,name,description) values('300100030003','保存商品目录','保存商品目录');
insert into c_business_type(business_type_cd,name,description) values('300100040001','修改商品信息','修改商品信息');
insert into c_business_type(business_type_cd,name,description) values('300100040002','修改商品目录','修改商品目录');
insert into c_business_type(business_type_cd,name,description) values('300100050001','删除商品信息','删除商品信息');
insert into c_business_type(business_type_cd,name,description) values('300100050002','修改商品目录','修改商品目录');
insert into c_business_type(business_type_cd,name,description) values('400100030001','保存评论','保存评论');
insert into c_business_type(business_type_cd,name,description) values('400100050001','删除评论','删除评论');
insert into c_business_type(business_type_cd,name,description) values('500100030001','保存小区信息','保存小区信息');
insert into c_business_type(business_type_cd,name,description) values('500100030002','小区成员加入信息','小区成员加入信息');
insert into c_business_type(business_type_cd,name,description) values('500100040001','修改商户信息','修改商户信息');
insert into c_business_type(business_type_cd,name,description) values('500100040002','小区成员退出信息','小区成员退出信息');
insert into c_business_type(business_type_cd,name,description) values('500100050001','删除商户信息','删除商户信息');
insert into c_business_type(business_type_cd,name,description) values('600100030002','保存物业照片','保存物业照片');
insert into c_business_type(business_type_cd,name,description) values('600100030003','保存物业证件','保存物业证件');
insert into c_business_type(business_type_cd,name,description) values('600100030004','保存物业员工','保存物业员工');
insert into c_business_type(business_type_cd,name,description) values('600100030005','保存物业费用','保存物业费用');
insert into c_business_type(business_type_cd,name,description) values('600100030006','保存住户','保存住户');
insert into c_business_type(business_type_cd,name,description) values('600100040001','修改物业信息','修改物业信息');
insert into c_business_type(business_type_cd,name,description) values('600100040002','修改物业照片','修改物业照片');
insert into c_business_type(business_type_cd,name,description) values('600100040003','修改物业证件','修改物业证件');
insert into c_business_type(business_type_cd,name,description) values('600100040004','修改 费用信息','修改 费用信息');
insert into c_business_type(business_type_cd,name,description) values('600100040005','修改住户信息','修改住户信息');
insert into c_business_type(business_type_cd,name,description) values('600100050001','删除物业属性','删除物业属性');
insert into c_business_type(business_type_cd,name,description) values('600100050002','删除物业照片','删除物业照片');
insert into c_business_type(business_type_cd,name,description) values('600100050003','删除 物业证件','删除 物业证件');
insert into c_business_type(business_type_cd,name,description) values('600100050004','删除物业员工','删除物业员工');
insert into c_business_type(business_type_cd,name,description) values('600100050005','删除住户','删除住户');
insert into c_business_type(business_type_cd,name,description) values('700100030001','保存代理商信息','保存代理商信息');
insert into c_business_type(business_type_cd,name,description) values('700100030002','保存代理商照片','保存代理商照片');
insert into c_business_type(business_type_cd,name,description) values('700100030003','保存代理商证件','保存代理商证件');
insert into c_business_type(business_type_cd,name,description) values('700100030004','添加代理商员工','添加代理商员工');
insert into c_business_type(business_type_cd,name,description) values('700100040001','修改代理商信息','修改代理商信息');
insert into c_business_type(business_type_cd,name,description) values('700100040002','修改代理商照片','修改代理商照片');
insert into c_business_type(business_type_cd,name,description) values('700100040003','修改代理商证件','修改代理商证件');
insert into c_business_type(business_type_cd,name,description) values('700100050001','删除代理商属性','删除代理商属性');
insert into c_business_type(business_type_cd,name,description) values('700100050002','删除代理商照片','删除代理商照片');
insert into c_business_type(business_type_cd,name,description) values('700100050003','删除代理商证件','删除代理商证件');
insert into c_business_type(business_type_cd,name,description) values('700100050004','删除代理商员工','删除代理商员工');

-- spec

CREATE TABLE spec(
    id INT NOT NULL AUTO_INCREMENT KEY COMMENT 'id',
    domain varchar(20) not null comment '属性域',
    spec_cd VARCHAR(12) NOT NULL UNIQUE COMMENT '业务项类型规格编码，从x00020001开始每次加一就可以(约定，x=10表示c_orders_attrs 中属性，x=11表示c_business_attrs 中的属性)',
    `name` VARCHAR(50) NOT NULL COMMENT '名称',
    description VARCHAR(200) COMMENT '描述',
    create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
);

insert into spec(domain,spec_cd,name,description) values('ORDERS','100001','订单来源','订单来源');
insert into spec(domain,spec_cd,name,description) values('BUSINESS','200001','推荐UserID','推荐UserID');

-- c_route

CREATE TABLE c_route(
    id INT NOT NULL AUTO_INCREMENT KEY COMMENT 'id',
    app_id VARCHAR(10) NOT NULL COMMENT '应用ID',
    service_id VARCHAR(12) NOT NULL COMMENT '下游接口配置ID',
    order_type_cd VARCHAR(4) NOT NULL COMMENT '订单类型，参考c_order_type表',
    invoke_limit_times INT COMMENT '接口调用一分钟调用次数',
    invoke_model VARCHAR(1) NOT NULL COMMENT 'S-同步方式 A-异步方式',
    create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    status_cd VARCHAR(2) NOT NULL DEFAULT '0' COMMENT '数据状态，详细参考c_status表，0在用，1失效，2 表示下线（当组件调用服务超过限制时自动下线）'
);



-- c_service

CREATE TABLE c_service(
    id INT NOT NULL AUTO_INCREMENT KEY COMMENT 'id',
    service_id VARCHAR(12) NOT NULL COMMENT '服务ID',
    service_code VARCHAR(50) NOT NULL UNIQUE COMMENT '自定义，命名方式查询类query.+目标系统+.+业务名称 保存类 save.+目标系统+.+业务名称 修改类 modify.+目标系统+.+业务名称 删除类 remove.+目标系统+.+业务名称 例如：query.user.userinfo save.user.adduserinfo',
    business_type_cd VARCHAR(12) NOT NULL COMMENT '业务项类型，参考c_business_type表',
    `name` VARCHAR(50) NOT NULL COMMENT '服务名称',
    seq INT NOT NULL COMMENT '顺序 只有同步方式下根据seq从小到大调用接口',
    messageQueueName VARCHAR(50) COMMENT '消息队里名称 只有异步时有用',
    is_instance varchar(2) not null default 'N' comment '是否Instance Y 需要，N不需要，NT透传类',
    url VARCHAR(200) COMMENT '目标地址',
    method VARCHAR(50) COMMENT '方法 空 为http post LOCAL_SERVICE 为调用本地服务 其他为webservice方式调用',
    timeout INT NOT NULL DEFAULT 60 COMMENT '超时时间',
    retry_count INT NOT NULL DEFAULT 3 COMMENT '重试次数',
    provide_app_id VARCHAR(30) NOT NULL COMMENT '应用ID',
    create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    status_cd VARCHAR(2) NOT NULL default '0' COMMENT '数据状态，详细参考c_status表，0在用，1失效',
    UNIQUE KEY (service_id)
);
-- 服务业务表
create table c_service_business(
    service_business_id INT NOT NULL AUTO_INCREMENT KEY COMMENT 'id',
    business_type_cd VARCHAR(12) NOT NULL COMMENT '业务项类型，参考c_business_type表',
    invoke_type varchar(4) not null comment '调用类型，1 http-post(微服务内应用) 2 webservice 3 http-post(微服务之外应用)',
    url VARCHAR(200) COMMENT '目标地址',
    message_topic varchar(50) comment '异步时的消息topic名称',
    timeout INT NOT NULL DEFAULT 60 COMMENT '超时时间',
    retry_count INT NOT NULL DEFAULT 3 COMMENT '重试次数',
    create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    status_cd VARCHAR(2) NOT NULL default '0' COMMENT '数据状态，详细参考c_status表，0在用，1失效',
    UNIQUE KEY (business_type_cd)
);





-- c_mapping

CREATE TABLE c_mapping(
    id INT NOT NULL AUTO_INCREMENT KEY COMMENT 'id',
    domain VARCHAR(50) NOT NULL COMMENT '域',
    `name` VARCHAR(50) NOT NULL COMMENT '名称',
    `key` VARCHAR(100) NOT NULL COMMENT 'key',
    `value` VARCHAR(1000) NOT NULL COMMENT 'value',
    remark VARCHAR(200) COMMENT '描述',
    create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    status_cd VARCHAR(2) NOT NULL DEFAULT '0' COMMENT '数据状态，详细参考c_status表，0在用，1失效'
);

INSERT c_mapping(domain,`name`,`key`,`value`,remark) VALUES('DOMAIN.COMMON','日志开关','LOG_ON_OFF','ON','日志开关');
INSERT c_mapping(domain,`name`,`key`,`value`,remark) VALUES('DOMAIN.COMMON','耗时开关','COST_TIME_ON_OFF','ON','耗时开关');
INSERT c_mapping(domain,`name`,`key`,`value`,remark) VALUES('DOMAIN.COMMON','规则开关','RULE_ON_OFF','OFF','规则开关');
INSERT c_mapping(domain,`name`,`key`,`value`,remark) VALUES('DOMAIN.COMMON','不调规则服务的订单类型','NO_NEED_RULE_VALDATE_ORDER','Q','不调规则服务的订单类型');
INSERT c_mapping(domain,`name`,`key`,`value`,remark) VALUES('DOMAIN.COMMON','不保存订单信息','NO_SAVE_ORDER','Q,T','不保存订单信息');
-- INSERT c_mapping(domain,`name`,`key`,`value`,remark) VALUES('DOMAIN.COMMON','不用调用 下游系统的配置','NO_INVOKE_BUSINESS_SYSTEM','Q','不用调用 下游系统的配置(一般不存在这种情况，这里主要是在没有下游系统的情况下测试中心服务用)');
INSERT c_mapping(domain,`name`,`key`,`value`,remark) VALUES('DOMAIN.COMMON','不用调用 作废下游系统的配置','NO_INVALID_BUSINESS_SYSTEM','Q','不用调用 作废下游系统的配置 (一般不存在这种情况，这里主要是在没有下游系统的情况下测试中心服务用)');
INSERT c_mapping(domain,`name`,`key`,`value`,remark) VALUES('DOMAIN.COMMON','需要调用服务生成各个ID','NEED_INVOKE_SERVICE_GENERATE_ID','OFF','需要调用服务生成各个ID');
INSERT c_mapping(domain,`name`,`key`,`value`,remark) VALUES('DOMAIN.COMMON','公钥','PUBLIC_STRING','MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDloKXSBA5+tP39uS8yi5RZOs6Jdrt0znRQetyXX2l/IUCi1x1QAMgoZbnEavmdZ5jOZN/T1WYFbt/VomXEHaTdStAiYm3DCnxxy5CMMyRKai0+6n4lLJQpUmnAQPFENrOV8b70gBSBVjUXksImgui5qYaNqX90pjEzcyq+6CugBwIDAQAB','公钥');
INSERT c_mapping(domain,`name`,`key`,`value`,remark) VALUES('DOMAIN.COMMON','私钥','PRIVATE_STRING','MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAJbtQYV+VpWZvifoc0R11MyAfIyMGoJKHDrWQau7oxLHotDDJM80o7ea7oL2onaHWOXaybpUp5FpZgjuixYMhlQOA/VXosrJOGJhgNv0dAL6VVXxmjlg2UWqIEoyTS7IzF3BuQCqy2k9aT7mGiC0RYRpndTuwe/0DKwFx70dIIIrAgMBAAECgYBMNMHnqLIJWZa1Sd6hy6lGFP5ObROZg9gbMUH5d4XQnrKsHEyCvz6HH5ic0fGYTaDqdn1zMvllJ8XYbrIV0P8lvHr9/LCnoXessmf61hKZyTKi5ycNkiPHTjmJZCoVTQFprcNgYeVX4cvNsqB2zWwzoAk8bbdWY6X5jB6YEpfBmQJBANiO9GiBtw+T9h60MpyV1xhJKsx0eCvxRZcsDB1OLZvQ7dHnsHmh0xUBL2MraHKnQyxOlrIzOtyttxSTrQzwcM0CQQCyajkzxpF6EjrXWHYVHb3AXFSoz5krjOkLEHegYlGhx0gtytBNVwftCn6hqtaxCxKMp00ZJoXIxo8d9tQy4N7XAkBljnTT5bEBnzPWpk7t298pRnbJtvz8LoOiJ0fvHlCJN+uvemXqRJeGzC165kpvKj14M8q7+wZpoxWukqqe3MspAkAuFYHw/blV7p+EQDU//w6kQTUc5YKK3TrUwMwlgT/UqcTbDyf+0hwZ/jv3RkluMY35Br3DYU/tLFyLQNZOzgbBAkEApWARXVlleEYbv8dPUL+56S0ky1hZSuPfVOBda4V3p0q18LjcHIyYcVhKGqkpii5JgblaYyjUriNDisFalCp8jQ==','私钥');
INSERT c_mapping(domain,`name`,`key`,`value`,remark) VALUES('DOMAIN.COMMON','外部应用公钥','PUBLIC_STRING','MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCW7UGFflaVmb4n6HNEddTMgHyMjBqCShw61kGru6MSx6LQwyTPNKO3mu6C9qJ2h1jl2sm6VKeRaWYI7osWDIZUDgP1V6LKyThiYYDb9HQC+lVV8Zo5YNlFqiBKMk0uyMxdwbkAqstpPWk+5hogtEWEaZ3U7sHv9AysBce9HSCCKwIDAQAB','外部应用公钥');
INSERT c_mapping(domain,`name`,`key`,`value`,remark) VALUES('DOMAIN.COMMON','外部应用私钥','PRIVATE_STRING','MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAOWgpdIEDn60/f25LzKLlFk6zol2u3TOdFB63JdfaX8hQKLXHVAAyChlucRq+Z1nmM5k39PVZgVu39WiZcQdpN1K0CJibcMKfHHLkIwzJEpqLT7qfiUslClSacBA8UQ2s5XxvvSAFIFWNReSwiaC6Lmpho2pf3SmMTNzKr7oK6AHAgMBAAECgYEAlfR5FVNM2/X6QC0k408/i53Zru94r2j7kGsLj1bhoAHpIe502AAKtkboL5rkc6Rpp688dCvRug6T4gFxj8cEF7rOOU4CHqVCHUHa4sWSDL2Rg7pMbQOVB7PGmM4C/hEgXcwM6tmLiU3xkkQDrpgT1bPpAm7iwDx4HkZBv1naYnECQQDyk40+KDvyUgp/r1tKbkMLoQOAfTZPXy+HgeAkU3PCUTFQlvn2OU6Fsl3Yjlp6utxPVnd00DoPZ8qvx1falaeLAkEA8lWoIDgyYwnibv2fr3A715PkieJ0exKfLb5lSD9UIfGJ9s7oTcltl7pprykfSP46heWjScS7YJRZHPfqb1/Y9QJAJNUQqjJzv7yDSZX3t5p8ZaSiIn1gpLagQeQPg5SETCoF4eW6uI9FA/nsU/hxdpcu4oEPjFYdqr8owH31MgRtNwJAaE+6qPPHrJ3qnAAMJoZXG/qLG1cg8IEZh6U3D5xC6MGBs31ovWMBC5iwOTeoQdE8+7nXSb+nMHFq0m9cuEg3qQJAH4caPSQ9RjVOP9on+niy9b1mATbvurepIB95KUtaHLz1hpihCLR7dTwrz8JOitgFE75Wzt4a00GZYxnaq3jsjA==','外部应用私钥');
INSERT c_mapping(domain,`name`,`key`,`value`,remark) VALUES('DOMAIN.COMMON','默认KEY_SIZE','DEFAULT_DECRYPT_KEY_SIZE','2048','默认KEY_SIZE');
INSERT c_mapping(domain,`name`,`key`,`value`,remark) VALUES('DOMAIN.COMMON','中心服务地址','CENTER_SERVICE_URL','http://center-service/httpApi/service','中心服务地址');
INSERT c_mapping(domain,`name`,`key`,`value`,remark) VALUES('DOMAIN.COMMON','控制中心APP_ID','CONSOLE_SERVICE_APP_ID','8000418002','控制中心APP_ID');
INSERT c_mapping(domain,`name`,`key`,`value`,remark) VALUES('DOMAIN.COMMON','控制服务加密开关','KEY_CONSOLE_SERVICE_SECURITY_ON_OFF','ON','控制服务加密开关');
INSERT c_mapping(domain,`name`,`key`,`value`,remark) VALUES('DOMAIN.COMMON','控制服务鉴权秘钥','CONSOLE_SECURITY_CODE','WEBURFPKIFJUHNCJUEIKMKJUJHULSMNCHDY89KMC','控制服务鉴权秘钥');
INSERT c_mapping(domain,`name`,`key`,`value`,remark) VALUES('DOMAIN.COMMON','编码生成服务地址','CODE_PATH','http://code-service/codeApi/generate','编码生成服务地址');
INSERT c_mapping(domain,`name`,`key`,`value`,remark) VALUES('DOMAIN.COMMON','API服务地址','API_SERVICE_URL','http://api-service/api/#serviceCode#','API服务地址');

-- c_app
CREATE TABLE c_app(
    id INT NOT NULL AUTO_INCREMENT KEY COMMENT 'id',
    app_id VARCHAR(10) NOT NULL UNIQUE COMMENT '应用ID',
    `name` VARCHAR(50) NOT NULL COMMENT '名称 对应系统名称',
    security_code VARCHAR(64) NOT NULL COMMENT '签名码 sign签名时用',
    while_list_ip VARCHAR(200) COMMENT '白名单ip 多个之间用;隔开',
    black_list_ip VARCHAR(200) COMMENT '黑名单ip 多个之间用;隔开',
    remark VARCHAR(200) COMMENT '描述',
    create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    status_cd VARCHAR(2) NOT NULL DEFAULT '0' COMMENT '数据状态，详细参考c_status表，0在用，1失效',
    UNIQUE KEY (app_id)
);

-- c_service_sql
CREATE TABLE c_service_sql(
    id INT NOT NULL AUTO_INCREMENT KEY COMMENT 'id',
    service_code VARCHAR(50) NOT NULL UNIQUE COMMENT '对应c_service表',
    `name` VARCHAR(50) NOT NULL COMMENT '名称',
    params VARCHAR(500) NOT NULL COMMENT '参数',
    query_model VARCHAR(1) NOT NULL COMMENT '查询方式 1、sql,2、存储过程',
    `sql` LONGTEXT COMMENT '执行sql',
    proc VARCHAR(200) COMMENT '存储过程名称',
    java_script LONGTEXT COMMENT '执行java脚本代码',
    template LONGTEXT COMMENT '输出模板',
    remark VARCHAR(200) COMMENT '描述',
    create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    status_cd VARCHAR(2) NOT NULL DEFAULT '0' COMMENT '数据状态，详细参考c_status表，0在用，1失效'
);

-- 测试用

insert into c_order_type(order_type_cd,`name`,description) values('Q','查询单','查询单');
insert into c_order_type(order_type_cd,`name`,description) values('D','受理单','受理单');

insert into c_app(app_id,`name`,security_code,remark,status_cd)
values('8000418001','内部测试应用','WEBURFPKIFJUHNCJUEIKMKJUJHULSMNCHDY89KMC','记得删除','0');

insert into c_app(app_id,`name`,security_code,remark,status_cd)
values('8000418002','控制中心应用','WEBURFPKIFJUHNCJUEIKMKJUJHULSMNCHDY89KMC','控制中心应用','0');

insert into c_app(app_id,`name`,security_code,remark,status_cd)
values('8000418003','用户管理应用','WEBURFPKIFJUHNCJUEIKMKJUJHULSMNCHDY89KMC','用户管理应用','0');

insert into c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id,status_cd)
values('1','query.user.userInfo','Q','用户信息查询',1,'http://...','8000418001','0');

insert into c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id,status_cd)
values('2','query.order.orderInfo','Q','订单信息',1,'http://center-service/businessApi/query','8000418001','0');

insert into c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id,status_cd)
values('3','query.console.menu','Q','查询菜单',1,'http://center-service/businessApi/query','8000418002','0');

insert into c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id,status_cd)
values('4','query.user.loginInfo','Q','查询用户登录信息',1,'http://center-service/businessApi/query','8000418002','0');

INSERT INTO c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id)
VALUES('5','query.console.template','Q','查询模板信息',1,'http://center-service/businessApi/query','8000418002');

INSERT INTO c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id)
VALUES('6','query.console.templateCol','Q','查询列模板信息',1,'http://center-service/businessApi/query','8000418002');

INSERT INTO c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id)
VALUES('7','query.center.mapping','Q','查询映射数据',1,'http://center-service/businessApi/query','8000418002');

INSERT INTO c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id)
VALUES('8','query.center.apps','Q','查询外部应用',1,'http://center-service/businessApi/query','8000418002');

INSERT INTO c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id)
VALUES('9','query.center.services','Q','查询服务',1,'http://center-service/businessApi/query','8000418002');

INSERT INTO c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id)
VALUES('10','query.center.routes','Q','查询路由',1,'http://center-service/businessApi/query','8000418002');

INSERT INTO c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id)
VALUES('11','flush.center.cache','Q','CenterService缓存',1,'http://center-service/cacheApi/flush','8000418002');

INSERT INTO c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id)
VALUES('12','query.console.caches','Q','查询所有缓存',1,'http://center-service/businessApi/query','8000418002');

INSERT INTO c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id)
VALUES('13','query.console.cache','Q','查询所有缓存',1,'http://center-service/businessApi/query','8000418002');


INSERT INTO c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id)
VALUES('14','save.center.mapping','Q','保存映射信息',1,'http://center-service/businessApi/do','8000418002');

INSERT INTO c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id)
VALUES('15','delete.center.mapping','Q','删除映射信息',1,'http://center-service/businessApi/do','8000418002');

INSERT INTO c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id)
VALUES('16','update.center.mapping','Q','修改映射信息',1,'http://center-service/businessApi/do','8000418002');

INSERT INTO c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id)
VALUES('17','save.user.userInfo','D','保存用户信息',1,'http://user-service/userApi/service','8000418003');

INSERT INTO c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id)
VALUES('18','save.store.info','D','保存商户信息',1,'http://store-service/storeApi/service','8000418003');

INSERT INTO c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id)
VALUES('19','update.store.info','D','修改商户信息',1,'http://store-service/storeApi/service','8000418003');

INSERT INTO c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id)
VALUES('20','delete.store.info','D','删除商户信息',1,'http://store-service/storeApi/service','8000418003');


INSERT INTO c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id)
VALUES('21','transfer.console.menu','T','透传菜单查询',1,'http://192.168.31.199:8001/userApi/service','8000418001');

INSERT INTO c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id)
VALUES('22','save.shop.info','D','保存商品信息',1,'http://shop-service/shopApi/service','8000418003');

INSERT INTO c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id)
VALUES('23','update.shop.info','D','修改商品信息',1,'http://shop-service/shopApi/service','8000418003');

INSERT INTO c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id)
VALUES('24','delete.shop.info','D','删除商品信息',1,'http://shop-service/shopApi/service','8000418003');

INSERT INTO c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id)
VALUES('25','buy.shop.info','D','购买商品信息',1,'http://shop-service/shopApi/service','8000418003');

INSERT INTO c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id)
VALUES('26','save.shop.catalog','D','保存商品目录信息',1,'http://shop-service/shopApi/service','8000418003');

INSERT INTO c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id)
VALUES('27','update.shop.catalog','D','修改商品目录信息',1,'http://shop-service/shopApi/service','8000418003');

INSERT INTO c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id)
VALUES('28','delete.shop.catalog','D','删除商品目录信息',1,'http://shop-service/shopApi/service','8000418003');


INSERT INTO c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id)
VALUES('29','save.comment.info','D','保存评论',1,'http://comment-service/commentApi/service','8000418003');

INSERT INTO c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id)
VALUES('30','delete.comment.info','D','删除评论',1,'http://comment-service/commentApi/service','8000418003');


INSERT INTO c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id)
VALUES('31','member.joined.store','D','商户成员加入',1,'http://store-service/storeApi/service','8000418003');

INSERT INTO c_service(service_id,service_code,business_type_cd,`name`,seq,url,provide_app_id)
VALUES('32','member.quit.store','D','商户成员退出',1,'http://store-service/storeApi/service','8000418003');


insert into c_route(app_id,service_id,invoke_model,order_type_cd,status_cd) values(
'8000418001','1','S','Q','0'
);

insert into c_route(app_id,service_id,invoke_model,order_type_cd,status_cd) values(
'8000418001','3','S','Q','0'
);

insert into c_route(app_id,service_id,invoke_model,order_type_cd,status_cd) values(
'8000418002','3','S','Q','0'
);

insert into c_route(app_id,service_id,invoke_model,order_type_cd,status_cd) values(
'8000418002','4','S','Q','0'
);

insert into c_route(app_id,service_id,invoke_model,order_type_cd,status_cd) values(
'8000418002','5','Q','0'
);

INSERT INTO c_route(app_id,service_id,invoke_model,order_type_cd,status_cd) VALUES(
'8000418002','6','S','Q','0'
);

INSERT INTO c_route(app_id,service_id,invoke_model,order_type_cd,status_cd) VALUES(
'8000418002','7','S','Q','0'
);

INSERT INTO c_route(app_id,service_id,invoke_model,order_type_cd,status_cd) VALUES(
'8000418002','8','S','Q','0'
);

INSERT INTO c_route(app_id,service_id,invoke_model,order_type_cd,status_cd) VALUES(
'8000418002','9','S','Q','0'
);


INSERT INTO c_route(app_id,service_id,invoke_model,order_type_cd,status_cd) VALUES(
'8000418002','10','S','Q','0'
);

INSERT INTO c_route(app_id,service_id,invoke_model,order_type_cd,status_cd) VALUES(
'8000418002','11','S','Q','0'
);

INSERT INTO c_route(app_id,service_id,invoke_model,order_type_cd,status_cd) VALUES(
'8000418002','12','S','Q','0'
);
INSERT INTO c_route(app_id,service_id,invoke_model,order_type_cd,status_cd) VALUES(
'8000418002','13','S','Q','0'
);

INSERT INTO c_route(app_id,service_id,invoke_model,order_type_cd,status_cd) VALUES(
'8000418002','14','S','Q','0'
);
INSERT INTO c_route(app_id,service_id,invoke_model,order_type_cd,status_cd) VALUES(
'8000418002','15','S','Q','0'
);

INSERT INTO c_route(app_id,service_id,invoke_model,order_type_cd,status_cd) VALUES(
'8000418002','16','S','Q','0'
);
INSERT INTO c_route(app_id,service_id,invoke_model,order_type_cd,status_cd) VALUES(
'8000418002','17','S','Q','0'
);

insert into c_route(app_id,service_id,invoke_model,order_type_cd,status_cd) values(
'8000418001','21','S','Q','0'
);

insert into c_route(app_id,service_id,invoke_model,order_type_cd,status_cd) values(
'8000418001','22','S','Q','0'
);

insert into c_route(app_id,service_id,invoke_model,order_type_cd,status_cd) values(
'8000418001','23','S','Q','0'
);

insert into c_route(app_id,service_id,invoke_model,order_type_cd,status_cd) values(
'8000418001','24','S','Q','0'
);
insert into c_route(app_id,service_id,invoke_model,order_type_cd,status_cd) values(
'8000418001','25','S','Q','0'
);
insert into c_route(app_id,service_id,invoke_model,order_type_cd,status_cd) values(
'8000418001','26','S','Q','0'
);
insert into c_route(app_id,service_id,invoke_model,order_type_cd,status_cd) values(
'8000418001','27','S','Q','0'
);






INSERT INTO c_service_sql(service_code,`name`,params,query_model,`sql`,proc,template,remark,status_cd)
VALUES('query.order.orderInfo','订单信息','oId','1','{
                                                 	"param1":"SELECT co.app_id appId,co.create_time createTime,co.ext_transaction_id extTransactionId,co.finish_time finishTime
                                                 ,co.order_type_cd orderTypeCd,co.o_id oId ,co.remark remark ,co.request_time requestTime ,co.user_id userId,co.status_cd statusCd
                                                  FROM c_orders co WHERE co.o_id = #oId#",
                                                  "param2":"SELECT cb.b_id bId, cb.business_type_cd businessTypeCd,cb.create_time createTime,cb.finish_time finishTime ,cb.o_id oId,
                                                 cb.remark remark,cb.status_cd statusCd FROM c_business cb WHERE cb.o_id = #oId#"
                                                 }','','{"PARAM":{
                                                            "param1": "$.#order#Object",
                                                            "param2": "$.#business#Array"
                                                            },"TEMPLATE":{
                                                         "response": {
                                                           "code": "0000",
                                                           "message": "成功"
                                                         }
                                                       }}','','0');

INSERT INTO c_service_sql(service_code,`name`,params,query_model,`sql`,proc,template,remark,status_cd)
VALUES('query.console.menu','查询菜单','manageId,menuGroup','1','{
                                                 	"param1":"select mm.m_id mId,mm.name name,mm.level level,mm.parent_id parentId,mm.menu_group menuGroup,mm.user_id userId,mm.create_time createTime,
                                                              mm.remark remark,mmc.url url,mmc.template template
                                                              from m_menu_2_user mm2u,m_menu mm, m_menu_ctg mmc
                                                              where mm2u.user_id = #manageId#
                                                              and mm2u.m_id = mm.m_id
                                                              AND mm.menu_group = #menuGroup#
                                                              and mm2u.status_cd = ''0''
                                                              and mm.status_cd = ''0''
                                                              and mmc.m_id = mm.m_id
                                                              and mmc.status_cd = ''0''
                                                              order by mm.seq asc"
                                                 }','','{"PARAM":{
                                                            "param1": "$.#menus#Array"
                                                            },"TEMPLATE":{
                                                         "response": {
                                                           "code": "0000",
                                                           "message": "成功"
                                                         }
                                                       }}','','0');

INSERT INTO c_service_sql(service_code,`name`,params,query_model,`sql`,proc,template,remark,status_cd)
VALUES('query.user.loginInfo','查询用户登录信息','userCode','1','{
                                                 	"param1":"SELECT ''10001'' userId,''admin'' userName,''d57167e07915c9428b1c3aae57003807'' userPwd FROM DUAL WHERE #userCode#=''admin''"
                                                 }','','{"PARAM":{
                                                            "param1": "$.#user#Object"
                                                            },"TEMPLATE":{
                                                         "response": {
                                                           "code": "0000",
                                                           "message": "成功"
                                                         }
                                                       }}','','0');


INSERT INTO c_service_sql(service_code,`name`,params,query_model,`sql`,proc,template,remark,status_cd)
VALUES('query.console.template','查询模板信息','templateCode','1','{
                                                 	"param1":"SELECT t.template_code templateCode,t.name templateName,t.`html_name` htmlName,t.`url` templateUrl
                                                              FROM c_template t WHERE t.status_cd = ''0'' AND t.template_code = #templateCode#"
                                                 }','','{"PARAM":{
                                                            "param1": "$.#template#Object"
                                                            },"TEMPLATE":{
                                                         "response": {
                                                           "code": "0000",
                                                           "message": "成功"
                                                         }
                                                       }}','','0');


INSERT INTO c_service_sql(service_code,`name`,params,query_model,`sql`,proc,template,remark,status_cd)
VALUES('query.console.templateCol','查询模板列信息','templateCode','1','{
                                                 	"param1":"SELECT t.template_code templateCode,t.name templateName,tc.col_name colName,tc.col_model colModel FROM c_template t,c_template_col tc WHERE t.status_cd = ''0'' AND t.template_code = tc.template_code
                                                              AND tc.status_cd = ''0''
                                                              AND t.template_code = #templateCode#"
                                                 }','','{"PARAM":{
                                                            "param1": "$.#template#Array"
                                                            },"TEMPLATE":{
                                                         "response": {
                                                           "code": "0000",
                                                           "message": "成功"
                                                         }
                                                       }}','','0');

INSERT INTO c_service_sql(service_code,`name`,params,query_model,`sql`,proc,template,remark,status_cd)
VALUES('query.center.mapping','查询映射数据','page,rows,sord','1','{"param1":"select count(1) records,ceil(#page#/#rows#)+1 page,ceil(count(1)/#rows#) total from c_mapping m where m.status_cd = ''0''",
                                                             "param2":"SELECT m.`id` id,m.`domain` domain,m.name name,m.`key`  `key` ,m.`value` `value`,m.`remark` remark FROM c_mapping m WHERE m.`status_cd` = ''0'' LIMIT #page#, #rows#"
                                                             }','','{
                                                        	"PARAM": {
                                                        		"param1": "$.##Object",
                                                        		"param2": "$.#rows#Array"
                                                        	},
                                                        	"TEMPLATE": {
                                                        		"response": {
                                                        			"code": "0000",
                                                        			"message": "成功"
                                                        		}
                                                        	}
                                                        }','','0');
INSERT INTO c_service_sql(service_code,`name`,params,query_model,`sql`,proc,template,remark,status_cd)
VALUES('query.center.apps','查询外部应用','page,rows,sord','1','{"param1":"select count(1) records,ceil(#page#/#rows#)+1 page,ceil(count(1)/#rows#) total from c_app a where a.status_cd = ''0''",
                                                             "param2":"SELECT m.`id` id,m.`app_id` appId,m.name `name`,m.`security_code`  securityCode ,m.`while_list_ip` whileListIp,m.`black_list_ip` blackListIp,m.`remark` remark FROM c_app m WHERE m.`status_cd` = ''0'' LIMIT #page#, #rows#"
                                                             }','','{
                                                        	"PARAM": {
                                                        		"param1": "$.##Object",
                                                        		"param2": "$.#rows#Array"
                                                        	},
                                                        	"TEMPLATE": {
                                                        		"response": {
                                                        			"code": "0000",
                                                        			"message": "成功"
                                                        		}
                                                        	}
                                                        }','','0');

INSERT INTO c_service_sql(service_code,`name`,params,query_model,`sql`,proc,template,remark,status_cd)
VALUES('query.center.services','查询服务数据','page,rows,sord','1','{"param1":"select count(1) records,ceil(#page#/#rows#)+1 page,ceil(count(1)/#rows#) total from c_service a where a.status_cd = ''0''",
                                                             "param2":"SELECT s.`service_id` serviceId,s.`service_code` serviceCode,s.`business_type_cd`  businessTypeCd,s.name `name`,s.is_instance isInstance,
                                                                       s.`messageQueueName` messageQueueName,s.url url,s.`provide_app_id` provideAppId FROM c_service s WHERE s.`status_cd` = ''0'' LIMIT #page#, #rows#"
                                                             }','','{
                                                        	"PARAM": {
                                                        		"param1": "$.##Object",
                                                        		"param2": "$.#rows#Array"
                                                        	},
                                                        	"TEMPLATE": {
                                                        		"response": {
                                                        			"code": "0000",
                                                        			"message": "成功"
                                                        		}
                                                        	}
                                                        }','','0');

INSERT INTO c_service_sql(service_code,`name`,params,query_model,`sql`,proc,template,remark,status_cd)
VALUES('query.center.route','查询路由数据','page,rows,sord','1','{"param1":"select count(1) records,ceil(#page#/#rows#)+1 page,ceil(count(1)/#rows#) total from c_route a,c_service cs WHERE a.`service_id` = cs.`service_id` AND cs.`status_cd` = ''0'' and a.status_cd = ''0''",
                                                             "param2":"SELECT s.id id,s.`app_id` appId,s.`service_id` serviceId,s.`invoke_model` invokeModel,cs.`name` serviceName,cs.`service_code` serviceCode,s.`order_type_cd` orderTypeCd,s.`invoke_limit_times` invokelimitTimes FROM c_route s,c_service cs WHERE s.`service_id` = cs.`service_id` AND cs.`status_cd` = ''0'' AND s.`status_cd` = ''0'' LIMIT #page#, #rows#"
                                                             }','','{
                                                        	"PARAM": {
                                                        		"param1": "$.##Object",
                                                        		"param2": "$.#rows#Array"
                                                        	},
                                                        	"TEMPLATE": {
                                                        		"response": {
                                                        			"code": "0000",
                                                        			"message": "成功"
                                                        		}
                                                        	}
                                                        }','','0');

INSERT INTO c_service_sql(service_code,`name`,params,query_model,`sql`,proc,template,remark,status_cd)
VALUES('query.console.caches','查询缓存数据','userId','1','{
                                                             "param1":"SELECT c.id id,c.`cache_code` cacheCode, c.`name` cacheName FROM c_cache c, c_cache_2_user c2u WHERE c.`cache_code` = c2u.`cache_code` AND c.`status_cd` = ''0''
                                                                       AND c2u.`status_cd` = ''0'' AND c2u.`user_id` = #userId# AND c.`group` = ''COMMON'' ORDER BY c.`seq` ASC"
                                                             }','','{
                                                        	"PARAM": {
                                                        		"param1": "$.#rows#Array"
                                                        	},
                                                        	"TEMPLATE": {
                                                        		"response": {
                                                        			"code": "0000",
                                                        			"message": "成功"
                                                        		}
                                                        	}
                                                        }','','0');
INSERT INTO c_service_sql(service_code,`name`,params,query_model,`sql`,proc,template,remark,status_cd)
VALUES('query.console.cache','查询单条缓存信息','cacheCode','1','{
                                                             "param1":"SELECT c.id id,c.`cache_code` cacheCode, c.`name` cacheName,c.`param` param,c.`service_code` serviceCode FROM c_cache c WHERE  c.`status_cd` = ''0'' AND c.`cache_code` = #cacheCode#"
                                                             }','','{
                                                        	"PARAM": {
                                                        		"param1": "$.#cache#Object"
                                                        	},
                                                        	"TEMPLATE": {
                                                        		"response": {
                                                        			"code": "0000",
                                                        			"message": "成功"
                                                        		}
                                                        	}
                                                        }','','0');


INSERT INTO c_service_sql(service_code,`name`,params,query_model,`sql`,proc,template,remark,status_cd)
VALUES('save.center.mapping','保存映射信息','domain,name,key,value,remark','1','{
                                                             "param1":"INSERT c_mapping(domain,`name`,`key`,`value`,remark) VALUES(#domain#,#name#,#key#,#value#,#remark#)"
                                                             }','','{
                                                        	"TEMPLATE": {
                                                        		"response": {
                                                        			"code": "0000",
                                                        			"message": "成功"
                                                        		}
                                                        	}
                                                        }','','0');
INSERT INTO c_service_sql(service_code,`name`,params,query_model,`sql`,proc,template,remark,status_cd)
VALUES('delete.center.mapping','删除映射信息','id','1','{
                                                             "param1":"UPDATE c_mapping m SET m.status_cd = ''1'' WHERE m.status_cd = ''0'' AND m.id = #id#"
                                                             }','','{
                                                        	"TEMPLATE": {
                                                        		"response": {
                                                        			"code": "0000",
                                                        			"message": "成功"
                                                        		}
                                                        	}
                                                        }','','0');
INSERT INTO c_service_sql(service_code,`name`,params,query_model,`sql`,proc,template,remark,status_cd)
VALUES('update.center.mapping','修改映射信息','id,domain,name,key,value,remark','1','{
                                                             "param1":"UPDATE c_mapping m SET m.domain=#domain#,m.name = #name#,m.key=#key#,m.value=#value#,m.remark=#remark# WHERE m.status_cd = ''0'' AND m.id = #id#"
                                                             }','','{
                                                        	"TEMPLATE": {
                                                        		"response": {
                                                        			"code": "0000",
                                                        			"message": "成功"
                                                        		}
                                                        	}
                                                        }','','0');





