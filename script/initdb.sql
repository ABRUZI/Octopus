


/*==============================================================*/
/* Table: ����ע���                                            */
/*==============================================================*/
create table DES_FLOW_REG
(
   ID                   CHAR(40) not null comment 'ID',
   NAME                 VARCHAR(128) comment '����',
   MODEL_STR            TEXT comment '����ģ��',
   CRON_EXPR            VARCHAR(64) comment '����ʹ�õ�cron���ʽ',
   STATUS               CHAR(2) comment '����״̬',
   CREATOR_ID           CHAR(40) comment '�����˵�ID',
   CREATE_TIME          timestamp comment '����ʱ��',
   MODIFIER_ID          CHAR(40) comment '����޸���ID',
   MODIFY_TIME          timestamp comment '����޸�ʱ��',
   PARAM_STR            text comment '�����ִ�',
   primary key (ID)
);

alter table DES_FLOW_REG comment '����ע���';


/*==============================================================*/
/* Table: ����ע���                                            */
/*==============================================================*/
create table DES_JOB_REG
(
   ID                   CHAR(40) not null,
   FLOW_ID              CHAR(40),
   NAME                 VARCHAR(128),
   TYPE_CODE            CHAR(2) comment '�������ʹ���',
   IS_FATAL             CHAR(1) comment '�Ƿ�ؼ����񡣷ǹؼ�����ִ�г��ִ���ʱ����Ӱ���������̼���ִ�С�0��1��',
   IS_JUDGE             CHAR(1) comment '�Ƿ���һ���ж����͵�����0��1��',
   CLASS_NAME           Text comment 'Java���������class����',
   SHELL_COMMAND        Text comment 'Shell�ű�',
   primary key (ID)
);

alter table DES_JOB_REG comment '����ע���';

/*==============================================================*/
/* Table: ��ϵע���                                            */
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

alter table DES_LINE_REG comment '��ϵע���';

/*==============================================================*/
/* Table: ����ִ����־��                                        */
/*==============================================================*/
create table DES_FLOW_EXEC_LOG
(
   ID                   CHAR(40) not null comment 'ִ��ʱ���õ�ID��ÿ��ִ�л᲻ͬ',
   FLOW_ID              CHAR(40),
   STATUS               CHAR(2) comment '����ִ�е�״̬',
   primary key (ID)
);

alter table DES_FLOW_EXEC_LOG comment '����ִ����־��';


/*==============================================================*/
/* Table: ����ִ����־��                                        */
/*==============================================================*/
create table DES_JOB_EXEC_LOG
(
   ID                   CHAR(40) not null,
   FLOW_EXEC_ID         CHAR(40) comment '���̵�����ʱID����������DES_FLOW_EXEC_LOG���ID',
   JOB_ID               CHAR(40) comment '�����ID',
   EXEC_TIMES           INT comment '��һ��Flowִ�й�����һ��Job���ܻ�ִ�ж�Σ����ֶ����������ǵڼ���ִ��',
   OUTPUT_LOG           TEXT comment '��׼�������־',
   STATUS               CHAR(2) comment '����״̬',
   ERROR_LOG            Text comment '������־',
   primary key (ID)
);

alter table DES_JOB_EXEC_LOG comment '����ִ����־��';


/*==============================================================*/
/* Table: ����״̬�����                                      */
/*==============================================================*/
create table CODE_FLOW_STATUS
(
   CODE                 CHAR(2),
   NAME                 VARCHAR(16)
);

alter table CODE_FLOW_STATUS comment '����״̬�����
01 �����
02 ʹ����';

/*==============================================================*/
/* Table: ����ִ��״̬�����                                    */
/*==============================================================*/
create table CODE_FLOW_EXEC_STATUS
(
   CODE                 CHAR(2),
   NAME                 VARCHAR(16)
);

alter table CODE_FLOW_EXEC_STATUS comment '����ִ��״̬�����

01 ִ����
02 ִ�����
03 ִ��ʧ��';


/*==============================================================*/
/* Table: ����ִ��״̬�����                                  */
/*==============================================================*/
create table CODE_JOB_EXEC_STATUS
(
   CODE                 CHAR(2),
   NAME                 VARCHAR(16)
);

alter table CODE_JOB_EXEC_STATUS comment '����ִ��״̬�����

01 ִ����
02 ִ�гɹ�
03 ִ��ʧ��';

