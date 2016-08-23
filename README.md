# octopus

##简介
		octopus使用Java语言开发，目前支持的任务的实现类型有Java和Linux命令两种。
		octopus中，执行单元是Flow,Flow中可以有若干个Job组成一个有向无环图(DAG)，
    执行器在执行时会解析DAG,然后分别执行Flow中的每个Job。Job从用途来说，分为两类
    一类是任务节点，一类是条件节点。这样我们可以在Flow中构建出任务的顺序分支执行。
		从技术架构角度看，octopus 由如下几部分构成:
			1. master 负责启动flow。可以支持HA
			2. slaver  负责执行flow。
			3. web-console 负责提供flow 的配置界面，执行控制界面与监控界面
			4. zookeeper master节点的HA和slaver节点任务分派都依赖于它
			5. DB 关系型数据库，用来存储用户的配置、flow的执行日志等信息

##当前进度：
	1. master 开发完成80% 缺少命令行接口, 缺少程序日志输出
	2. slaver 开发完成80% 缺少命令行接口, 缺少程序日志输出, 缺少执行job时子进程的输出信息保存, 缺少flow执行记录的保存
	3. web-console 0%
