-- ���ݵ�׼��
	-- ����һ�����ݿ�
	create database python_test charset=utf8;

	-- ʹ��һ�����ݿ�
	use python_test;

	-- ��ʾʹ�õĵ�ǰ�������ĸ�?
	select database();

	-- ����һ�����ݱ�
	-- students��
	create table students(
	    id int unsigned primary key auto_increment not null,
	    name varchar(20) default '',
	    age tinyint unsigned default 0,
	    height decimal(5,2),
	    gender enum('��','Ů','����','����') default '����',
	    cls_id int unsigned default 0,
	    is_delete bit default 0
	);

	-- classes��
	create table classes (
	    id int unsigned auto_increment primary key not null,
	    name varchar(30) not null
	);



-- ��ѯ
	-- ��ѯ�����ֶ�
	-- select * from ����;
	select * from students;
	select * from classes;
	select id, name from classes;

	-- ��ѯָ���ֶ�
	-- select ��1,��2,... from ����;
	select name, age from students;
	
	-- ʹ�� as ���ֶ������
	-- select �ֶ� as ����.... from ����;
	select name as ����, age as ���� from students;

	-- select ����.�ֶ� .... from ����;
	select students.name, students.age from students;

	
	-- ����ͨ�� as ���������
	-- select ����.�ֶ� .... from ���� as ����;
	select students.name, students.age from students;
	select s.name, s.age from students as s;
	-- ʧ�ܵ�select students.name, students.age from students as s;


	-- �����ظ���
	-- distinct �ֶ�
	select distinct gender from students;


-- ������ѯ
	-- �Ƚ������
		-- select .... from ���� where .....
		-- >
		-- ��ѯ����18�����Ϣ
		select * from students where age>18;
		select id,name,gender from students where age>18;

		-- <
		-- ��ѯС��18�����Ϣ
		select * from students where age<18;

		-- >=
		-- <=
		-- ��ѯС�ڻ��ߵ���18�����Ϣ

		-- =
		-- ��ѯ����Ϊ18�������ѧ��������
		select * from students where age=18;


		-- != ���� <>


	-- �߼������
		-- and
		-- 18��28֮�������ѧ����Ϣ
		select * from students where age>18 and age<28;
		-- ʧ��select * from students where age>18 and <28;


		-- 18�����ϵ�Ů��
		select * from students where age>18 and gender="Ů";
		select * from students where age>18 and gender=2;


		-- or
		-- 18���ϻ�����߲��180(����)����
		select * from students where age>18 or height>=180;


		-- not
		-- ���� 18�����ϵ�Ů�� �����Χ�ڵ���Ϣ
		-- select * from students where not age>18 and gender=2;
		select * from students where not (age>18 and gender=2);

		-- ���䲻��С�ڻ��ߵ���18 ������Ů��
		select * from students where (not age<=18) and gender=2;


	-- ģ����ѯ
		-- like 
		-- % �滻1�����߶��
		-- _ �滻1��
		-- ��ѯ������ �� "С" ��ʼ������
		select name from students where name="С";
		select name from students where name like "С%";

		-- ��ѯ������ �� "С" ���е�����
		select name from students where name like "%С%";

		-- ��ѯ��2���ֵ�����
		select name from students where name like "__";

		-- ��ѯ��3���ֵ�����
		select name from students where name like "__";

		-- ��ѯ������2���ֵ�����
		select name from students where name like "__%";


		-- rlike ����
		-- ��ѯ�� �ܿ�ʼ������
		select name from students where name rlike "^��.*";

		-- ��ѯ�� �ܿ�ʼ���׽�β������
		select name from students where name rlike "^��.*��$";


	-- ��Χ��ѯ
		-- in (1, 3, 8)��ʾ��һ���������ķ�Χ��
		-- ��ѯ ����Ϊ18��34������
		select name,age from students where age=18 or age=34;
		select name,age from students where age=18 or age=34 or age=12;
		select name,age from students where age in (12, 18, 34);


		
		-- not in ���������ķ�Χ֮��
		-- ���䲻�� 18��34��֮�����Ϣ
		select name,age from students where age not in (12, 18, 34);


		-- between ... and ...��ʾ��һ�������ķ�Χ��
		-- ��ѯ ������18��34֮��ĵ���Ϣ
		select name, age from students where age between 18 and 34;

		
		-- not between ... and ...��ʾ����һ�������ķ�Χ��
		-- ��ѯ ���䲻����18��34֮��ĵ���Ϣ
		select * from students where age not between 18 and 34;
		select * from students where not age between 18 and 34;
		-- ʧ�ܵ�select * from students where age not (between 18 and 34);


	-- ���ж�
		-- �п�is null
		-- ��ѯ���Ϊ�յ���Ϣ
		select * from students where height is null;
		select * from students where height is NULL;
		select * from students where height is Null;

		-- �зǿ�is not null
		select * from students where height is not null;



-- ����
	-- order by �ֶ�
	-- asc��С�������У�������
	-- desc�Ӵ�С���򣬼�����

	-- ��ѯ������18��34��֮������ԣ����������С��������
	select * from students where (age between 18 and 34) and gender=1;
	select * from students where (age between 18 and 34) and gender=1 order by age;
	select * from students where (age between 18 and 34) and gender=1 order by age asc;


	-- ��ѯ������18��34��֮���Ů�ԣ���ߴӸߵ�������
	select * from students where (age between 18 and 34) and gender=2 order by height desc;
	

	-- order by ����ֶ�
	-- ��ѯ������18��34��֮���Ů�ԣ���ߴӸߵ�������, ��������ͬ������°��������С��������
	select * from students where (age between 18 and 34) and gender=2 order by height desc,id desc;


	-- ��ѯ������18��34��֮���Ů�ԣ���ߴӸߵ�������, ��������ͬ������°��������С��������,
	-- �������Ҳ��ͬ��ô����id�Ӵ�С����
	select * from students where (age between 18 and 34) and gender=2 order by height desc,age asc,id desc;

	
	-- ���������С������ߴӸߵ���������
	select * from students order by age asc, height desc;


-- �ۺϺ���
	-- ����
	-- count
	-- ��ѯ�����ж����ˣ�Ů���ж�����
	select * from students where gender=1;
	select count(*) from students where gender=1;
	select count(*) as �������� from students where gender=1;
	select count(*) as Ů������ from students where gender=2;


	-- ���ֵ
	-- max
	-- ��ѯ��������
	select age from students;
	select max(age) from students;

	-- ��ѯŮ�Ե���� ���
	select max(height) from students where gender=2;

	-- ��Сֵ
	-- min

	
	-- ���
	-- sum
	-- ���������˵������ܺ�
	select sum(age) from students;

	
	-- ƽ��ֵ
	-- avg
	-- ����ƽ������
	select avg(age) from students;


	-- ����ƽ������ sum(age)/count(*)
	select sum(age)/count(*) from students;


	-- �������� round(123.23 , 1) ����1λС��
	-- ���������˵�ƽ�����䣬����2λС��
	select round(sum(age)/count(*), 2) from students;
	select round(sum(age)/count(*), 3) from students;

	-- �������Ե�ƽ����� ����2λС��
	select round(avg(height), 2) from students where gender=1;
	-- select name, round(avg(height), 2) from students where gender=1;

-- ����

	-- group by
	-- �����Ա����,��ѯ���е��Ա�
	select name from students group by gender;
	select * from students group by gender;
	select gender from students group by gender;
	-- ʧ��select * from students group by gender;

	-- ����ÿ���Ա��е�����
	select gender,count(*) from students group by gender;


	-- �������Ե�����
	select gender,count(*) from students where gender=1 group by gender;


	-- group_concat(...)
	-- ��ѯͬ���Ա��е�����
 	select gender,group_concat(name) from students where gender=1 group by gender;
 	select gender,group_concat(name, age, id) from students where gender=1 group by gender;
 	select gender,group_concat(name, "_", age, " ", id) from students where gender=1 group by gender;

	-- having
	-- ��ѯƽ�����䳬��30����Ա��Լ����� having avg(age) > 30
	select gender, group_concat(name),avg(age) from students group by gender having avg(age)>30;
	
	-- ��ѯÿ���Ա��е���������2������Ϣ
	select gender, group_concat(name) from students group by gender having count(*)>2;



-- ��ҳ
	-- limit start, count

	-- ���Ʋ�ѯ���������ݸ���
	select * from students where gender=1 limit 2;

	-- ��ѯǰ5������
	select * from students limit 0, 5;

	-- ��ѯid6-10��������������
	select * from students limit 5, 5;


	-- ÿҳ��ʾ2������1��ҳ��
	select * from students limit 0,2;

	-- ÿҳ��ʾ2������2��ҳ��
	select * from students limit 2,2;

	-- ÿҳ��ʾ2������3��ҳ��
	select * from students limit 4,2;

	-- ÿҳ��ʾ2������4��ҳ��
	select * from students limit 6,2; -- -----> limit (��Nҳ-1)*ÿ���ĸ���, ÿҳ�ĸ���;

	-- ÿҳ��ʾ2������ʾ��6ҳ����Ϣ, ���������С��������
	-- ʧ��select * from students limit 2*(6-1),2;
	-- ʧ��select * from students limit 10,2 order by age asc;
	select * from students order by age asc limit 10,2;

	select * from students where gender=2 order by height desc limit 0,2;



-- ���Ӳ�ѯ
	-- inner join ... on

	-- select ... from ��A inner join ��B;
	select * from students inner join classes;

	-- ��ѯ ���ܹ���Ӧ�༶��ѧ���Լ��༶��Ϣ
	select * from students inner join classes on students.cls_id=classes.id;

	-- ����Ҫ����ʾ�������༶
	select students.*, classes.name from students inner join classes on students.cls_id=classes.id;
	select students.name, classes.name from students inner join classes on students.cls_id=classes.id;

	-- �����ݱ�������
	select s.name, c.name from students as s inner join classes as c on s.cls_id=c.id;

	-- ��ѯ ���ܹ���Ӧ�༶��ѧ���Լ��༶��Ϣ����ʾѧ����������Ϣ��ֻ��ʾ�༶����
	select s.*, c.name from students as s inner join classes as c on s.cls_id=c.id;
	
	-- �����ϵĲ�ѯ�У����༶������ʾ�ڵ�1��
	select c.name, s.* from students as s inner join classes as c on s.cls_id=c.id;

	-- ��ѯ ���ܹ���Ӧ�༶��ѧ���Լ��༶��Ϣ, ���հ༶��������
	-- select c.xxx s.xxx from student as s inner join clssses as c on .... order by ....;
	select c.name, s.* from students as s inner join classes as c on s.cls_id=c.id order by c.name;

	-- ��ʱͬһ���༶��ʱ�򣬰���ѧ����id���д�С��������
	select c.name, s.* from students as s inner join classes as c on s.cls_id=c.id order by c.name,s.id;

	-- left join
	-- ��ѯÿλѧ����Ӧ�İ༶��Ϣ
	select * from students as s left join classes as c on s.cls_id=c.id;

	-- ��ѯû�ж�Ӧ�༶��Ϣ��ѧ��
	-- select ... from xxx as s left join xxx as c on..... where .....
	-- select ... from xxx as s left join xxx as c on..... having .....
	select * from students as s left join classes as c on s.cls_id=c.id having c.id is null;
	select * from students as s left join classes as c on s.cls_id=c.id where c.id is null;

	-- right join   on
	-- �����ݱ����ֻ���λ�ã���left join���

-- �Թ���
	-- ʡ������ url:http://demo.lanrenzhijia.com/2014/city0605/

	-- ��ѯ����ʡ��
	select * from areas where pid is null;

	-- ��ѯ��ɽ��ʡ����Щ��
	select * from areas as province inner join areas as city on city.pid=province.aid having province.atitle="ɽ��ʡ";
	select province.atitle, city.atitle from areas as province inner join areas as city on city.pid=province.aid having province.atitle="ɽ��ʡ";

	-- ��ѯ���ൺ������Щ�س�
	select province.atitle, city.atitle from areas as province inner join areas as city on city.pid=province.aid having province.atitle="�ൺ��";
	select * from areas where pid=(select aid from areas where atitle="�ൺ��")


-- �Ӳ�ѯ
	-- �����Ӳ�ѯ
	-- ��ѯ������ƽ����ߵ���Ϣ

	-- ��ѯ��ߵ�������Ϣ
	select * from students where height = 188;
	select * from students where height = (select max(height) from students);

	-- �м��Ӳ�ѯ
	-- ��ѯѧ���İ༶���ܹ���Ӧ��ѧ����Ϣ
	-- select * from students where cls_id in (select id from classes);












