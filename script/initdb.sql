


/*==============================================================*/
/* Table: 流程注册表                                            */
/*==============================================================*/
create table DES_FLOW_REG
(
   ID                   CHAR(40) not null comment 'ID',
   NAME                 VARCHAR(128) comment '名称',
   MODEL_STR            TEXT comment '配置模型',
   CRON_EXPR            VARCHAR(64) comment '启动使用的cron表达式',
   STATUS               CHAR(2) comment '流程状态',
   CREATOR_ID           CHAR(40) comment '创建人的ID',
   CREATE_TIME          timestamp comment '创建时间',
   MODIFIER_ID          CHAR(40) comment '最后修改人ID',
   MODIFY_TIME          timestamp comment '最后修改时间',
   PARAM_STR            text comment '参数字串',
   primary key (ID)
);

alter table DES_FLOW_REG comment '流程注册表';


/*==============================================================*/
/* Table: 任务注册表                                            */
/*==============================================================*/
create table DES_JOB_REG
(
   ID                   CHAR(40) not null,
   FLOW_ID              CHAR(40),
   NAME                 VARCHAR(128),
   TYPE_CODE            CHAR(2) comment '任务类型代码',
   IS_FATAL             CHAR(1) comment '是否关键任务。非关键任务执行出现错误时不会影响整个流程继续执行。0否1是',
   IS_JUDGE             CHAR(1) comment '是否是一个判断类型的任务。0否，1是',
   CLASS_NAME           Text comment 'Java类型任务的class名称',
   SHELL_COMMAND        Text comment 'Shell脚本',
   primary key (ID)
);

alter table DES_JOB_REG comment '任务注册表';

/*==============================================================*/
/* Table: 关系注册表                                            */
/*==============================================================*/
create table DES_LINE_REG
(
   ID                   CHAR(40) not null,
   FLOW_ID              CHAR(40),
   SOURCE_ID            CHAR(40),
   TARGET_ID            CHAR(40),
   CONDITION_VAL        TEXT,
   primary key (ID)
);

alter table DES_LINE_REG comment '关系注册表';

/*==============================================================*/
/* Table: 流程执行日志表                                        */
/*==============================================================*/
create table DES_FLOW_EXEC_LOG
(
   ID                   CHAR(40) not null comment '执行时设置的ID，每次执行会不同',
   FLOW_ID              CHAR(40),
   STATUS               CHAR(2) comment '本次执行的状态',
   primary key (ID)
);

alter table DES_FLOW_EXEC_LOG comment '流程执行日志表';


/*==============================================================*/
/* Table: 任务执行日志表                                        */
/*==============================================================*/
create table DES_JOB_EXEC_LOG
(
   ID                   CHAR(40) not null,
   FLOW_EXEC_ID         CHAR(40) comment '流程的运行时ID，关联的是DES_FLOW_EXEC_LOG表的ID',
   JOB_ID               CHAR(40) comment '任务的ID',
   EXEC_TIMES           INT comment '在一个Flow执行过程中一个Job可能会执行多次，此字段用于区分是第几次执行',
   OUTPUT_LOG           TEXT comment '标准输出的日志',
   STATUS               CHAR(2) comment '运行状态',
   ERROR_LOG            Text comment '错误日志',
   primary key (ID)
);

alter table DES_JOB_EXEC_LOG comment '任务执行日志表';


/*==============================================================*/
/* Table: 流程状态代码表                                      */
/*==============================================================*/
create table CODE_FLOW_STATUS
(
   CODE                 CHAR(2),
   NAME                 VARCHAR(16)
);

alter table CODE_FLOW_STATUS comment '流程状态代码表
01 设计中
02 使用中';

/*==============================================================*/
/* Table: 流程执行状态代码表                                    */
/*==============================================================*/
create table CODE_FLOW_EXEC_STATUS
(
   CODE                 CHAR(2),
   NAME                 VARCHAR(16)
);

alter table CODE_FLOW_EXEC_STATUS comment '流程执行状态代码表

01 执行中
02 执行完毕
03 执行失败';


/*==============================================================*/
/* Table: 任务执行状态代码表                                  */
/*==============================================================*/
create table CODE_JOB_EXEC_STATUS
(
   CODE                 CHAR(2),
   NAME                 VARCHAR(16)
);

alter table CODE_JOB_EXEC_STATUS comment '任务执行状态代码表

01 执行中
02 执行成功
03 执行失败';

