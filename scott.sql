--DQL(�����ϴ� ��=�����,������ ��ȸ�Ѵ�)
--select  �÷� ��
--from ���̺� ��

--��ü������
select empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp; 

select * 
from emp;

--�κ� 3�� ������
select empno,ename,sal
from emp;

--�κ� 1�� ������
select deptno
from emp;

select DISTINCT(deptno)--�ߺ��Ȱ� ����
from emp;

select job
from emp;

select DISTINCT(job)
from emp;
--�����͸� ���ؼ� ������ ����� �� �ִ�.-,+,/,*
--�÷�������� �����Ѵ�
--null���� ������ �Ұ��ϴ�.
--�÷��� ��Ī�� ����� �� �ִ�.
select ename as ����� ,sal,sal*12+nvl(comm,0)as ����,comm--(comm,0)= comm�� 0���� �Ѵ�
from emp;--as����=> sal*12+nvl�� �κ��� �������� �̸��� �ٲ��


----------------------------------------------------------------10.18��
--order by=> ���ı����� �Ǵ� �� ex)asc(��������)/desc(��������)
select * 
from emp 
order by sal asc;--���������� ������ �����ϴ� =>������ ���¸� ������������ ����ȴ�
--����(1~10),��¥(���ų�¥~�ֽų�¥), ����(�����������),

--------------------------------------���ǰ˻�,������,
--select�÷���, from���̺���, where ���ǽ�(�÷��� =��)ex <,>,=,!=,/,<=,>=,and,or
select * 
from emp
where sal >=3000; --�޿��� 3000�̻��� ����� ���

select *
from emp
where deptno =30;--deptno�� 30�� �����

--and�� �ΰ��� ������ ��� ���� ��� ����
select *
from emp               --����Ŭ������ ''�� ���ڿ�����
where deptno =30 and  job = 'SALESMAN'and  empno = 7499;

select *
from emp
where ename = 'FORD';
--�ҹ��� ford�� ���� �빮�� FORD�� �־ ����Ҷ� �ȳ��´� 


-------------------------��¥�� �������� ����� ��
------------------��¥�� ũ�� �񱳰� �ְ�, ''�� ����Ѵ�
select *
from emp
where hiredate < '1982/01/01';


----------------or�� �ΰ��̻��� �����߿� �ϳ��̻� ���� ���
select *
from emp
where deptno = 10 or sal >=2000;


-------------------not �������� ������ 1��° ��� (!=)
select *
from emp
where sal !=3000;
--2��° ��� (not)
select *
from emp 
where not sal = 3000;


----------------------and,or ���� ������ ǥ�� �� �� ���
select *
from emp
where sal >= 1000 and sal <=3000;

select *
from emp
where sal <=1000 or sal >=3000;

-------------------------between and  ,in,like
select *
from emp
where sal not between 1000 and 3000;

select *
from emp
where sal= 800 or sal =3000 or sal=5000;
--in �� �Ἥ �� �ڵ�� ������ ��� ���� ���´�
select *
from emp
where sal in(800,3000,5000);

--------------------like�� ���� �Ϻθ� ������ �����͸� ��ȸ�Ѵ�.
--���ϵ� ī�带 ����Ѵ�(%,_) %�� ��� ���ڸ� ��ü,, _�� �� ���ڸ� ��ü�Ѵ�
select *
from emp
where ename like 'F%';--�̸��� F�� �����ϴ� ����� ���

select *
from emp
where ename like '%D';--�̸��� D�� ������ ����� ���

select *
from emp
where ename like '%O%';--�̸��� ���� �Ǵ� ���� O(�빮��)�� �Ǵ� ����� ���

select *
from emp
where ename like  '___D'; -- _(�����)3�����̸鼭 ���������� D�� ����� ���

select *
from emp
where ename like 'S__%';--S�� ���� �ϰ� ����� 2�� �̻��� ����� <= % ������

---------------------- null ������ (is null/is not null)
select *
from emp
where comm is null;

-----------------------------���տ�����
--������(MINUS),������(UNION),������(INTERSECT)
--ó��select�� ;�� �Ⱦ���
--2���� select������ ���,�÷��� ������ ����,�÷��� Ÿ���� ����,�÷��� �̸��� �������.

--������
select empno,ename,sal,deptno
from emp
where deptno = 20
UNION 
select empno,ename,sal,deptno
from emp
where deptno = 10;
--�ߺ��� ��¾ȵ����� All ����ϸ鼭 �ߺ��Ȱ͵� ��µȴ�
select empno,ename,sal,deptno
from emp
where deptno = 10
UNION ALL
select empno,ename,sal,deptno
from emp
where deptno = 10;

--������
select empno,ename,sal,deptno
from emp 
MINUS 
select empno,ename,sal,deptno
from emp
where deptno = 10;

--������
select empno,ename,sal,deptno
from emp
INTERSECT 
select empno,ename,sal,deptno
from emp
where deptno = 10;

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO in (20,30)
INTERSECT
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
where SAL > 2000;

--��ü������
select empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp; 

select * 
from emp;

--�κ� 3�� ������
select empno,ename,sal
from emp;

--�κ� 1�� ������
select deptno
from emp;

select DISTINCT(deptno)--�ߺ��Ȱ� ����
from emp;

select job
from emp;

select DISTINCT(job)
from emp;
--�����͸� ���ؼ� ������ ����� �� �ִ�.-,+,/,*
--�÷�������� �����Ѵ�
--null���� ������ �Ұ��ϴ�.
--�÷��� ��Ī�� ����� �� �ִ�.
select ename as ����� ,sal,sal*12+nvl(comm,0)as ����,comm--(comm,0)= comm�� 0���� �Ѵ�
from emp;--as����=> sal*12+nvl�� �κ��� �������� �̸��� �ٲ��


----------------------------------------------------------------10.18��
--p.85~

--order by=> ���ı����� �Ǵ� �� ex)asc(��������)/desc(��������)
select * 
from emp 
order by sal asc;--���������� ������ �����ϴ� =>������ ���¸� ������������ ����ȴ�
--����(1~10),��¥(���ų�¥~�ֽų�¥), ����(�����������),

--------------------------------------���ǰ˻�,������,
--select�÷���, from���̺���, where ���ǽ�(�÷��� =��)ex <,>,=,!=,/,<=,>=,and,or
select * 
from emp
where sal >=3000; --�޿��� 3000�̻��� ����� ���

select *
from emp
where deptno =30;--deptno�� 30�� �����

--and�� �ΰ��� ������ ��� ���� ��� ����
select *
from emp               --����Ŭ������ ''�� ���ڿ�����
where deptno =30 and  job = 'SALESMAN'and  empno = 7499;

select *
from emp
where ename = 'FORD';
--�ҹ��� ford�� ���� �빮�� FORD�� �־ ����Ҷ� �ȳ��´� 


-------------------------��¥�� �������� ����� ��
------------------��¥�� ũ�� �񱳰� �ְ�, ''�� ����Ѵ�
select *
from emp
where hiredate < '1982/01/01';


----------------or�� �ΰ��̻��� �����߿� �ϳ��̻� ���� ���
select *
from emp
where deptno = 10 or sal >=2000;


-------------------not �������� ������ 1��° ��� (!=)
select *
from emp
where sal !=3000;
--2��° ��� (not)
select *
from emp 
where not sal = 3000;


----------------------and,or ���� ������ ǥ�� �� �� ���
select *
from emp
where sal >= 1000 and sal <=3000;

select *
from emp
where sal <=1000 or sal >=3000;

-------------------------between and  ,in,like
select *
from emp
where sal not between 1000 and 3000;

select *
from emp
where sal= 800 or sal =3000 or sal=5000;
--in �� �Ἥ �� �ڵ�� ������ ��� ���� ���´�
select *
from emp
where sal in(800,3000,5000);

--------------------like�� ���� �Ϻθ� ������ �����͸� ��ȸ�Ѵ�.
--���ϵ� ī�带 ����Ѵ�(%,_) %�� ��� ���ڸ� ��ü,, _�� �� ���ڸ� ��ü�Ѵ�
select *
from emp
where ename like 'F%';--�̸��� F�� �����ϴ� ����� ���

select *
from emp
where ename like '%D';--�̸��� D�� ������ ����� ���

select *
from emp
where ename like '%O%';--�̸��� ���� �Ǵ� ���� O(�빮��)�� �Ǵ� ����� ���

select *
from emp
where ename like  '___D'; -- _(�����)3�����̸鼭 ���������� D�� ����� ���

select *
from emp
where ename like 'S__%';--S�� ���� �ϰ� ����� 2�� �̻��� ����� <= % ������

---------------------- null ������ (is null/is not null)
select *
from emp
where comm is null;

-----------------------------���տ�����
--������(MINUS),������(UNION),������(INTERSECT)
--ó��select�� ;�� �Ⱦ���
--2���� select������ ���,�÷��� ������ ����,�÷��� Ÿ���� ����,�÷��� �̸��� �������.

--������
select empno,ename,sal,deptno
from emp
where deptno = 20
UNION 
select empno,ename,sal,deptno
from emp
where deptno = 10;
--�ߺ��� ��¾ȵ����� All ����ϸ鼭 �ߺ��Ȱ͵� ��µȴ�
select empno,ename,sal,deptno
from emp
where deptno = 10
UNION ALL
select empno,ename,sal,deptno
from emp
where deptno = 10;

--������
select empno,ename,sal,deptno
from emp 
MINUS 
select empno,ename,sal,deptno
from emp
where deptno = 10;

--������
select empno,ename,sal,deptno
from emp
INTERSECT 
select empno,ename,sal,deptno
from emp
where deptno = 10;

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO in (20,30)
INTERSECT
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
where SAL > 2000;


---------------------------------����Ŭ �Լ�
--�ҹ��� ,�빮�� �� �� ��µȴ�
select 'Welcome',upper('Welcome')
from dual;

select lower(ename),upper(ename)
from emp;

select *
from emp
where ename = 'FORD';

select *
from emp
where lower(ename) = 'scott';
-------------����
select ename,length(ename)
from emp;
---------------substr
select 'Welcome to Oracle',substr('Welcome to Oracle',1,3)--1~3��°������ ����Ѵ�
from dual;--Wel ��µȴ�
select 'Welcome to Oracle',substr('Welcome to Oracle',-17)-- -17��°���� ����Ѵ�
from dual;--Welcome to Oracle ���

select instr('Welcome to Oracle','o')-- o�� ��ġ�� ã�´�
from dual;--5�� ���

select instr('Welcome to Oracle','o',6)-- 6��°�� ���������ϰ� ���� o�� ��ġ�� 10�̴�
from dual;--10�����

select instr('Welcome to Oracle','e',3,2)-- 3��°�� ���������ϰ� �ι�° e�� ��µȴ�
from dual;--17�� ���´�

-----------replace
select 'Welcome to Oracle',replace ('Welcome to Oracle','to','of')-- to�� of �� �ٲ��ش�
from dual;

-----------LPAD, RPAD
select 'oracle',lpad('oracle',10,'#'),rpad('oracle',10,'*'),lpad('oracle',10)
from dual;--####oracleoracle****    oracle

select rpad('990103-',14,'*')
from dual;--990103-*******

----------------------------10.19��-----------------------------------------
--p.146~
----------------------------��¥�Լ� --------------------
select sysdate -1 ����, sysdate, sysdate +1 ����
from dual;--22/10/18	22/10/19	22/10/20
----�ٹ��ϼ�
select sysdate - hiredate as �ٹ��ϼ� --���̰� �ϼ� ��ȯ
from emp;

----�ټӳ��
select trunc ((sysdate - hiredate)/365) as �ټӳ�� 
from emp;--41  trunc ����ϸ鼭 �Ҽ��� �����ȴ�
--41
--41
--41
--41
--41
--41
--35
--40
--41
--35
--40
--40
--40

select sysdate,
round(sysdate,'cc')as  CC,--���ڸ� ���� �� ���ڸ� ����
round(sysdate,'yyyy')as  yyyy, --�������� 7�� 1�� ����
round(sysdate,'Q')as q,--�ι�° ���� 16�ϱ���
round(sysdate,'DDD')as dd,--�ش� ���� ��������
round(sysdate,'HH')as hh-- �ش��� ����
from dual;

------------------------�ڷ��� ��ȯ �Լ�-------------------------
--to_char()
--to_number()
--to_date()

--��¥�� ���ڷ�
select sysdate,to_char(sysdate,'YYYY-MM-DD HH24:MI:SS')as ����ð�
from dual;--22/10/19	2022-10-19 11:02:21

select hiredate,to_char(hiredate,'YYYY-MM-DD HH24:MI:SS')as ����ð�
from emp;--80/12/17	1980-12-17....

--���ڸ� ���ڷ�
select to_char(123456,'999,999')
from dual;-- 123,456
select to_char(sal,'L999,999')
from emp;

--���ڸ� ���ڷ�
select 20000-10000 --��������(=�ڵ���)��ȯ
from dual;

select '20,000'-'10,000' --������ ���� =>to_number()����ȯ�� ������Ѵ�.
from dual;
select to_number('20,000','999,999')- to_number('5,000','999,999')
from dual;

--���ڸ� ��¥��
select to_date('20221019','YYYY/MM/DD')
from dual;--22/10/19

select *
from emp
where hiredate < to_date(' 19820101','YYYY-MM-DD');

----------------------nulló���Լ�----------------------------------
--null������ó��
--nvl(null,�ٲٰ� ����������)
--nvl�� null �������� Ÿ�԰� ���� Ÿ������ ����������Ѵ�.
--nvl(����,����),nvl(����,����)

select ename �����,sal,sal*12+nvl(comm,0) as ����,comm
from emp;--SMITH 800	9600	null
         --ALLEN 1600	19500	300
         --WARD	 1250	15500	500...

select *
from emp
where mgr is null;--7839	KING	PRESIDENT	81/11/17	5000	10

select ename,job,nvl(to_char(mgr,'9999'),'CEO')as mgr
from emp
where mgr is null;--KING	PRESIDENT	CEO

select comm,nvl2(comm,'O','X')
from emp;

------------------------------���ǹ� ǥ���ϴ� �Լ�-----------------------------
--���ǹ� ǥ���ϴ� �Լ�
--decode()->switch
--case    ->if

select ename,job,deptno,
decode(deptno,10,'AAA' ,20,'BBB' ,30,'CCC' ,'��Ÿ')as �μ���
from emp;

--case�� ����,������ ���ǽ����� ���� �� �� �ִ�.
--case 
--  when'���ǽ�'  then'���๮'
--  when'���ǽ�'  then'���๮'
--  when'���ǽ�'  then'���๮'
--  else'���๮'
--end as 000

select ename,job,deptno,--���� decode�� ���� ���� ��µȴ�
case 
  when deptno =10  then 'AAA'
  when deptno =20  then 'BBB'
  when deptno =30  then 'CCC'
  else'��Ÿ'
  end as �μ���
from emp;

select ename,job,sal,
case 
  when sal between 3000 and 5000 then'�ӿ�'
  when sal >=2000 and sal <3000 then'������'   
  when sal >=500 and sal<2000 then'���'
    else'��Ÿ'
    end as ����
from emp;

--6-1����
select empno,rpad(substr(empno,1,2),4,'*')as MASKING_ENPNO,
       ename,
       rpad(substr(ename,1,1),length(ename),'*')as MASKING_ENAME
  from emp
 where length(ename) >=5 --length ���ڿ����ϱ�
   and length(ename) < 6;
--6-2����
select empno,ename,sal,
      trunc(sal/21.5,2) as day_pay,--�Ϸ��ϴ� ���޿� 21.5 ������  �Ҽ��� 2° ¥������ �츮�� 3��°�ڸ����� �ݿø��Ѵ�. 
      round(sal/21.5/8,1)as TIME_PAY--�ð���ñ� 21.5/8 ������ �Ҽ��� 1°�ڸ����� ��� 2��°�ڸ����� �ݿø�
      from emp;
      
--6-4����
select empno,ename,mgr,
case
when mgr is null then '0000'
when substr(mgr,1,2)='78' then'8888' --1��° �����ؼ�2��°���� 78�� ����� 8888
when substr(mgr,1,2)='77' then'7777'
when substr(mgr,1,2)='76' then'6666'
when substr(mgr,1,2)='75' then'5555'
else to_char(mgr)
end as chg_mgr
from emp;

------------------------�������Լ�--------------------------
--�Ϲ��÷��� ���� �� �� ����,
--ũ��񱳰� ���� ��� Ÿ�Կ� ��밡��
--sum: 00�� ���� ��� ���� ��� ���� �ϳ��� ������ ��µȴ�.
select sum(sal)
from emp;
--avg:00�� ���� ���� ��� ��� ���� �ϳ��� ������ ��µȴ�.
select avg(sal)
from emp;
--count:��ü ���ڵ� ������ ��µȴ�.
select count(*),count(comm)
from emp;
--max:������ ������ �� �ִ밪��� <-> min
select max(sal),min(sal)
from emp;

select ename max(sal)
from emp;--������ ���� <=ename�� ������14 != max(sal)�� ������ 1������ �̽���Ī

select min(hiredate)--�Ի��� ���� �������<->max �Ի簡 ���� �ֱ��� ���
from emp;
where deptno =20;--�μ��ο��� 20����

-------�ϱ����--------------------------------------
--select �÷���(��)
--from ���̺���
--where ���ǽ�(�׷��ռ� ���Ұ�/�ݵ�� group by,having���� ��������!!)
--group by �÷���
--having ���ǽ�(�׷��Լ� ����Ѵ�)
--order by �÷��� ���Ĺ��=>�� �������� �ۼ��Ѵ�

------------------------group by��---------------------------------
--�� �μ��� ��� ���� �ѹ��� ��� ,      �Ʒ��� ������: �ϳ��ϳ� ���� �ؾߵȴ�
select avg(sal) from emp where deptno =10
union
select avg(sal) from emp where deptno =20
union
select avg(sal) from emp where deptno =30; 
--group by�� �̿��� ��հ� �ѹ��� ���,   ������ ������: �ѹ��� �����ϴ�
select avg(sal),deptno    --��°��� 3�� �����ؼ� ������ �ȳ��´�.
from emp
group by deptno;

select avg(sal),deptno,job
from emp
group by deptno,job
order by deptno,job desc;-- ��ü�� ���ĵǰ� job�� ������������ ���ĵȴ�.

-------------------------------having��--------------------------
select  deptno,avg(sal)
from emp
group by deptno
having avg(sal) >= 2000;    --group by���ؼ� ��ȸ ����� ������ �ش�,\
                            --���ǽ��� �ۼ��� �� �׷��Լ��� ����Ѵ�. 

-------------------------------10.20��-------------------------------------
--p215~
--------------------����(join)
--2���̻��� ���̺����� �����͸� ��ȸ
--from���� �ΰ��̻��� ���̺��� �ۼ��Ѵ�.
--join�Ҷ� where�� �ۼ��� �ؾ� �Ѵ�.
--cross join : ����� ����(where�� ���� ������)
--equi join : ���� ���� ����(where�� ��� ������� : =)
--non equi join : (where ���������� : and ,or)
--self join : where �ϳ��� ���̺��� ����Ѵ�.
--out join  :  (=�ܺ�����)��� �����Ǵ� ����Ʈ�� ���� ��ȸ �ϱ����ؼ� ��� (+)�� ����Ѵ�

select emp.ename,emp.job,emp.deptno,dept.dname,dept.loc--dname �μ��̸�, loc �ٹ���
from emp,dept
where emp.deptno=dept.deptno;

select ename,job,e.deptno,dname,loc--���ʿ� �̸��� ���� �� �÷��� �Ҽ��� ��������Ѵ�.ex)deptno�� ���� ����
from emp  e,dept  d--���̺��� ��Ī e, d �� ���鼭 where������ emp->e ,dept->d�� �ٲ��ش�
where e.deptno=d.deptno;  --select�� ��Ī������ 4���� vs from�� ��Ī�� �� ĭ ���� ����Ѵ�.

--equi join
select ename,job,e.deptno,dname,loc,sal
from emp  e,dept  d
where e.deptno=d.deptno
and sal >=3000;  

--non equi join
select ename,sal,grade,losal,hisal
from emp e,salgrade s
where e.sal bewteen s.losal and s.hisal;--  between and �� ��� �ؿ����� ������ ��� ���� ����Ѵ�.
--where e.sal >= s.losal and  e.sal <= s.hisal;--non equi join�� ���

--���,�̸�,�޿�, /�μ���ȣ ,�μ���, /�޿����
--emp�� ��ġ     /dept�� ��ġ      /salgrade

select empno,ename,sal,d.deptno,dname,grade
from emp e,dept d, salgrade s
where e. deptno = d.deptno
and e.sal between s.losal and s.hisal;

----self join  --�ϳ��� ���̺��� 2���� �и��Ѵٰ� ����
select e.empno ,e.ename,e.mgr,m.ename
from emp e,emp m--�ݵ�� ��Ī�ο�
where e.mgr = m.empno;

select ename,deptno
from emp
where deptno =20;
--SMITH	20
--JONES	20
--SCOTT	20
--ADAMS	20
--FORD	20


--scott�� ���� �μ��� �ٹ��ϴ� ��� -self join ���� ����غ���
--ename  ename 
--scott  simth
--scott  JONES
--scott  ADAMS
--scott  FORD                     
select  work.ename , friend.ename-- work->w, friend->f �� ��Ī�ؼ� ����
from emp work,emp friend
where work.deptno = friend.deptno
and work.ename = 'SCOTT'
and friend.ename != 'SCOTT';
--SCOTT	SMITH
--SCOTT	JONES
--SCOTT	ADAMS
--SCOTT	FORD

------out join
select e.empno ,e.ename,e.mgr,m.ename
from emp e,emp m --�ؿ� �ڵ�� deptno�� 40�� �����ϰ� ���� �����
where e.mgr = m.empno(+);--�����Ͱ� ���� ���̺��ʿ� (+)�� ���δ�.=>king�� �����Եȴ�

select ename,sal,d.deptno,dname
from emp e,dept d
where e.deptno(+) = d.deptno; --(+)�� ����ϸ鼭 =>deptno�� 40�� ��µȴ�.
--SMITH	800	20	RESEARCH
--ALLEN	1600	30	SALES
--WARD	1250	30	SALES
--JONES	2975	20	RESEARCH
--MARTIN	1250	30	SALES
--BLAKE	2850	30	SALES
--CLARK	2450	10	ACCOUNTING
--SCOTT	3000	20	RESEARCH
--KING	5000	10	ACCOUNTING
--TURNER	1500	30	SALES
--ADAMS	1100	20	RESEARCH
--JAMES	950	30	SALES
--FORD	3000	20	RESEARCH
--MILLER	1300	10	ACCOUNTING
--null	40	OPERATIONS


-------ANSI-JOIN(ǥ�����ι��)
--cross join, natural join : �� �����Ѵ�
--inner join(equi,non equi,self join)
--outer join((+)) [left or right or full] outer join

--inner join
select ename,sal,dname,loc
from emp e inner join dept d
using(deptno) --���� ���̺��� �÷����� �����Ѱ��
where ename = 'SCOTT';--SCOTT 3000 RESEARCH	DALLAS

select e.empno,e.ename,e.mgr,m.ename
from emp e inner join emp m
on e.mgr = m.empno;
--7902	FORD	7566	JONES
--7788	SCOTT	7566	JONES
--7900	JAMES	7698	BLAKE
--7844	TURNER	7698	BLAKE
--7654	MARTIN	7698	BLAKE
--7521	WARD	7698	BLAKE
--7499	ALLEN	7698	BLAKE
--7934	MILLER	7782	CLARK
--7876	ADAMS	7788	SCOTT
--7782	CLARK	7839	KING
--7698	BLAKE	7839	KING
--7566	JONES	7839	KING
--7369	SMITH	7902	FORD

select empno,ename,sal,grade
from emp e inner join salgrade s--inner join�� ����� on ���°� ����´�.
on e.sal between s.losal and s.hisal;
--7369	SMITH	800	    1
--7900	JAMES	950	    1
--7876	ADAMS	1100    1
--7521	WARD	1250	2
--7654	MARTIN	1250	2
--7934	MILLER	1300	2
--7844	TURNER	1500	3
--7499	ALLEN	1600	3
--7782	CLARK	2450	4
--7698	BLAKE	2850	4
--7566	JONES	2975	4
--7788	SCOTT	3000	4
--7902	FORD	3000	4
--7839	KING	5000	5

select e.empno,e.ename,e.mgr,m.ename
from emp e left outer join emp m --�����Ͱ� �ִ� ���� �����Ѵ�.
on e.mgr = m.empno;--null ŷ���� ���´�
--7902	FORD	7566	JONES
--7788	SCOTT	7566	JONES
--7900	JAMES	7698	BLAKE
--7844	TURNER	7698	BLAKE
--7654	MARTIN	7698	BLAKE
--7521	WARD	7698	BLAKE
--7499	ALLEN	7698	BLAKE
--7934	MILLER	7782	CLARK
--7876	ADAMS	7788	SCOTT
--7782	CLARK	7839	KING
--7698	BLAKE	7839	KING
--7566	JONES	7839	KING
--7369	SMITH	7902	FORD
--7839	KING	null	null

select empno,ename,sal,d.deptno,dname,grade
from emp e inner join dept d
on e. deptno = d.deptno
inner join salgrade s
on e.sal between s.losal and s.hisal;
--7369	SMITH	800	20	RESEARCH	    1
--7900	JAMES	950	30	SALES	        1
--7876	ADAMS	1100	20	RESEARCH	1
--7521	WARD	1250	30	SALES	    2
--7654	MARTIN	1250	30	SALES	    2
--7934	MILLER	1300	10	ACCOUNTING	2
--7844	TURNER	1500	30	SALES	    3
--7499	ALLEN	1600	30	SALES	    3
--7782	CLARK	2450	10	ACCOUNTING	4
--7698	BLAKE	2850	30	SALES	    4
--7566	JONES	2975	20	RESEARCH	4
--7788	SCOTT	3000	20	RESEARCH	4
--7902	FORD	3000	20	RESEARCH	4
--7839	KING	5000	10	ACCOUNTING	5

select ename,sal,d.deptno,dname
from emp e,dept d
where e.deptno(+) = d.deptno; 
--ANSI join ������� ���� ���� ����� ���
select ename,sal,d.deptno,dname
from emp e right outer join dept d
on e.deptno = d.deptno;
--SMITH	800	20	RESEARCH
--ALLEN	1600	30	SALES
--WARD	1250	30	SALES
--JONES	2975	20	RESEARCH
--MARTIN	1250	30	SALES
--BLAKE	2850	30	SALES
--CLARK	2450	10	ACCOUNTING
--SCOTT	3000	20	RESEARCH
--KING	5000	10	ACCOUNTING
--TURNER	1500	30	SALES
--ADAMS	1100	20	RESEARCH
--JAMES	950	30	SALES
--FORD	3000	20	RESEARCH
--MILLER	1300	10	ACCOUNTING
--null	null 	40	OPERATIONS

--8-1����
select d.deptno, d.dname , e.empno, e.ename, e.sal
from emp e, dept d
where e.deptno= d.deptno
and e.sal>2000;
--inner �������
select d.deptno, d.dname , e.empno, e.ename, e.sal
from emp e inner join dept d
on e.deptno= d.deptno
where e.sal>2000;


--8-2����
select d.deptno,d.dname, --�޸�(,)ǥ�� �ϱ�
trunc(avg(sal)) as avg_sal,
max(sal) as max_sal,
min(sal) as min_sal,
count(*) as cnt
from emp e, dept d
where e.deptno = d.deptno
group by d.deptno,d.dname;

select d.deptno,d.dname, 
trunc(avg(sal)) as avg_sal,
max(sal) as max_sal,
min(sal) as min_sal,
count(*) as cnt
from emp e inner join  dept d
on e.deptno = d.deptno
group by d.deptno,d.dname;

--8-3����
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
  FROM EMP E, DEPT D
 WHERE E.DEPTNO(+) = D.DEPTNO
ORDER BY D.DEPTNO, E.ENAME;

SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
  FROM EMP E right outer join DEPT D--e.deptno ���Խ�Ų��??
  on e.deptno = d.deptno
  order by d.deptno, e.ename;


--8-4����
SELECT D.DEPTNO, D.DNAME,
       E.EMPNO, E.ENAME, E.MGR, E.SAL, E.DEPTNO,
       S.LOSAL, S.HISAL, S.GRADE,
       E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
  FROM EMP E, DEPT D, SALGRADE S, EMP E2
 WHERE E.DEPTNO(+) = D.DEPTNO
   AND E.SAL BETWEEN S.LOSAL(+) AND S.HISAL(+)
   AND E.MGR = E2.EMPNO(+)
ORDER BY D.DEPTNO, E.EMPNO; 

select d.deptno,d.dname,e.empno,e.ename,e.mgr,e.sal,e.deptno,
s.losal,s.hisal,s.grade,m.empno,m.ename
from emp e right outer join dept d
on e.deptno = d.deptno
   full outer join salgrade s
on e.sal between s. losal and s. hisal
   left outer join emp m 
on e.mgr = m.empno
   order by d.deptno, e.empno;
   
   --------------------------------��������--------------------------------
   
   --select ������ ��ø�ؼ� ����ϴ� ��(where)
   select ename,max(sal)
   from emp;--��������(������,1��)�� ���� ������ ����
   
   select ename,sal
   from emp
   where sal = (
                select max(sal)
                from emp
                );--KING	5000
   
   select deptno
   from emp
   where ename ='SCOTT'
   20;
   
   select dname
   from dept
   where deptno =20;--RESEARCH
   
   select dname--���� ����
   from dept
   where deptno =(select deptno--��������
                  from emp
                  where ename ='SCOTT');--RESEARCH
   
   select ename,deptno
   from emp
   where deptno = (select deptno
                   from dept
                   where loc = 'DALLAS');
--SMITH	20                   
--JONES	20
--SCOTT	20
--ADAMS	20
--FORD	20


--�ڽ��� ���ӻ���� king �� ����� �̸��� �޿��� ��ȸ�ϼ���.
select ename,sal,mgr
from emp
where mgr =(select empno
            from emp
            where ename = 'KING');
--JONES	2975
--BLAKE	2850
--CLARK	2450

----�����༭������----------------p254
-- in   : ����߿� �ϳ��� �����ϸ�ȴ�.
-- >any : ����߿� ���� ���������� ũ��ȴ�
-- >all : ����߿� ���� ū�� ���� ũ��ȴ�.
select*
from emp
where sal in (5000,3000,2850);
--���� ���� �� ��µȴ�.

select*
from emp
where sal >any ( -- '<any'�� in���� �ٲ㵵 ���� ���� ���´�.�ǹ̴°��� ū������ ������  <-->  '>' ���� ���������� ū��
              select max(sal)
              from emp
              group by deptno);
--7566	JONES	MANAGER	7839	81/04/02	2975		20
--7788	SCOTT	ANALYST	7566	87/04/19	3000		20
--7839	KING	PRESIDENT		81/11/17	5000		10
--7902	FORD	ANALYST	7566	81/12/03	3000		20 

select ename,sal,deptno
from emp 
where sal > all (select sal  --all ����ū������ ū�� <--> '<all'�ּұ޿����� �� ���� ��
                 from emp
                 where deptno = 30);
              
-----���߿� ��������
select*
from emp
where (deptno,sal) in (select deptno,max(sal)
                       from emp
                       group by deptno);




------------------------------------------10.21------------------------------
--p.266~

--DML(���������۾�) : insert, update , delete
--insert : ���̺��� ������ ����
--insert into ���̺��� (�÷���1,�÷���2,...)
--values (��1,��2....)
--�÷��� ���� Ÿ�԰� ������ ��ġ�ؾ� �Ѵ�.( 1 : 1 )
--�ۼ� ������� 1:1��Ī�ȴ�

create table dept_temp
as
select * from dept;

select *
from dept_temp;

insert into dept_temp(deptno,dname,loc)
values(50,'DATABASE','SEOUL');--'50 DATABASE SEOUL'�� dept_temp���̺��� �߰���

insert into dept_temp(deptno,dname)--2���� �ְ� ������� loc�� null�� ���Եȴ�
values(60,'JSP');--null�� ������ ����

insert into dept_temp--�÷����� �� �� => 3���� ���� �Ȱ��� ���� ���Եȴ�.
values(70,'HTML','SEOUL');

insert into dept_temp--�÷�����, ������ null������ ����
values(80,'null','SEOUL');-- => 3���� ���� �Ȱ��� ���� ���Եȴ�.

create table emp_temp
as
select * from emp
where 1 != 1;

select *
from emp_temp;

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(9999,'ȫ�浿','PRESIDENT',null,'2001/01/01',5000,1000,10);

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values (3111,'��û��','MANGER',9999,sysdate,4000,null,30);

-------------update
--update : �÷��� �����͸� ����(����)
--update ���̺���
--set �÷��� =��,�÷��� =��,....
--where ���ǽ�
--�������� ������� ������ �ش� �÷��� ��� ����ȴ�.

create table dept_temp2
as 
select * 
from dept;

select* 
from dept_temp2;

update dept_temp2
set loc = 'SEOUL';--=>loc�κ��� �� ����� �ٲ��.

rollback;--=>�ٽ� ���� ����

update dept_temp2
set dname = 'DATABASE',loc = 'SEOUL'
where deptno =40;--=>40���μ������� ���� 2���� �ٲ��.

----------delete
--delete(�����ͻ���)
--delete from ���̺���
--where ���ǽ�
--�������� ������� ������ ��� �����Ͱ� �����ȴ�.

create table emp_temp2
as
select *
from emp;--=> ����

select *
from emp_temp2;--=>Ȯ��

delete from emp_temp2;--  ==>emp_temp2�� �����ȴ�.
drop table emp_temp2;--=>���̺� ��������
rollback;--

delete from emp_temp2
where ename = 'SCOTT';--=>scott�� ������


-------------------------------------------------Ʈ�����
------------------------------TCL(�������� �������� �Ǵ� ���)
--Ʈ������
--commit,rollback,savepoint
--commit 1) ������ ���� ����(���̺��� ������ �ݿ�)
--       2) create ������ ����ؼ� ��ü�����Ҷ� (�ڵ�) 
--rollback 1) ������ ���� ���(���̺��� ������ �̹ݿ�)=���󺹱�
--         2) õ������,����(�ڵ�)
--savepoint : 

create table dept01
as 
select *
from dept;

select *
from dept01;

delete from dept01;--=>����������Ʈ�� ��� ��������.
drop table dept01;
commit;--=> ���� ������Ʈ���� ��ϻ��� �Ϸ��

rollback;-->commit �� �ѹ� �Ͼ�� coommit �������� ���ư��� ������ ����� ������ �ȵȴ�!!!

truncate table dept01;-->�����Ϳ��������� �ǰ� �ѹ��� �ǵ� �����͸� �ҷ��� �� ����.


--------------------------------DDL(���������Ǿ�)-----------------
--DDL(������ ���Ǿ�) : table ��� ��ü�� ����,����,�����ϴ� ���ɾ�
--create-����,alter-����,drop-����,

--create table ���̺���(  --table(��ü)
--          �÷���1 Ÿ��, --column(�Ӽ�)
--          �÷���2 Ÿ��,
--          �÷���3 Ÿ��   ���������� ,�� ���ش�!!
--                       );

create table emp_ddl(
   --�Ӽ�(���,�̸�,��å,������,�Ի���,����,�޿�,������,�μ���ȣ)
   empno number(4),
   ename varchar2(10), --ũ��� �� byte
   job varchar2(9),
   mgr number(4),
   hiredate date,
   sal number(7,2),
   comm number(7,2),
   deptno number(2)
);

select *
from emp_DDL;

insert into emp_ddl
values (9999,'�̼���','MANGER',1111,sysdate,1000,null,10);

create table dept_ddl--���̺��� �����ϴ¿�(���or �׽�Ʈ)
as
select * 
from dept;

create table dept_30
as
select * from dept
where deptno =30;

select *
from dept_30;

create table dept_m
as
select dname,loc
from dept;

create table dept_d
as
select * from dept
where 1 != 1;  -- �� ���ǹ��� �ǹ̴� ���� �� ���°ſ���  ���̺��� ������ �����Ѵ�.

------------���̺� ����(�÷��� ���� ����)
--alter
--���ο� �÷��߰�,�÷��� �̸� ����,�ڷ����� ����,�÷��� ����

create table emp_alter
as
select * from emp;

select * from emp_alter;

alter table emp_alter
add address varchar2(100);--=> emp_alter���̺��� address�ּҰ� �߰���

alter table emp_alter
rename column address to addr;--address�ּҰ� addr�� ����

alter table emp_alter
modify empno number(10);--=>emp_hw�� �� Ŭ���ϸ� 10���� �����

alter table emp_alter-- addr�� ���� ������
drop column addr;

--12-1����
create table emp_hw(
empno number(4),
ename varchar2(10),
job varchar2(9),
mgr number(4),
hiredate date,
sal number(7,2),
comm number(7,2),
deptno number(2)
);
select * from emp_hw;

--12-2����
alter table emp_hw
add BIGO varchar2(20);

--12-3����
alter table emp_hw
modify BIGO VARCHAR2(30); 

--12-4����
alter table emp_hw
rename column BIGO to remark;

--12-5����
insert into emp_hw
select empno,ename,job,mgr,hiredate,sal,comm,deptno,null
from emp;

rollback;

select * from emp_hw;

drop table emp_hw;

----------------------------------------�����ͻ���
desc user_tables; --����Ȯ�ο�

select table_name
from user_tables; --����Ȯ�ο�

select owner,table_name
from all_tables;

------------------�ε���
--index : (�˻��ӵ��� ����Ű������ ��� ��ü)
--index create-����, drop-����
--select ������ �˻��ӵ��� ��� ��Ų��
--��ü ���ڵ��� 3%~5%�����϶� 
--index��ü�� �÷��� �����ؼ� ����Ѵ�.

--create index �ε�����
--on ���̺���(�÷���);

create table emp01
as
select* from emp;

select * from emp01;--������ 917,504���� ������ �߰�

insert into emp01
select * from emp01;

insert into emp01(empno,ename)
values(1111,'bts');

--index ��ü�� �����ϱ��� (0.034)
select empno,ename
from emp01
where ename = 'bts';

--index����
create index idx_emp01_ename
on emp01(ename);

--index ��ü�� �����ϱ� �� (0.005~0.001)
select empno,ename
from emp01
where ename = 'bts';
drop table emp01;
drop index idx_emp01_ename; --index ���� scott�� �ε��� emp01�� ������

--���̺� ������ ���� �ϴ¹�
--show recyclebin;(�����뿪Ȱ)�������� ����

show recyclebin;

FLASHBACK table emp01
to before drop; --�����Ȱ� ����

purge recyclebin; --������ ����

-------------------------------------10.24-------------------------------------

-----------------------------------��������-----------------------
--p.360
--��������(���Ἲ) : �߸��� ���� �����ͷ� ���Ǵ°��� ���ϰ� �ϴ°�
--������ ���Ἲ : �������� ��Ȯ���� �ϰ��� ����

-- not null : ������ ���� null���� ������
 -- unique  --> �ߺ��� ������ 
 -- primary key(�⺻Ű)(=not null+unique �� �� ����)
 -- foreign key(�ܷ�Ű=����Ű)
 -- 1. �θ�� �ڽ��� ���踦 ������ �ڽ��� ���̺��� �����Ѵ�.
 -- 2. �θ��� ���̺��� �÷��� �ݵ�� primary key �Ǵ� unique�ؾ� �Ѵ�.
 -- 3. null �����͸� ����Ѵ�.
 -- check
 --default
 
 -- emp,dept
 
 
 
 insert into emp
 values (1111,'aaa','MANAGE',9999,SYSDATE,1000,NULL,50);
 
 drop table emp02;
 
 create table emp02(--���̺�,���� Ʋ�� ����ٰ� ����
          empno number(4) primary key, -- (not null + unique) =primary key  
          ename varchar2(10) not null, -->not null�� ���������� ��
          job varchar2(9),
          deptno number(2)
 );
 --�⺻Ű �����ȣ�� ������
insert into emp02--���� �����͸� ���� ����vs create�� ��
values (1111,'ȫ�浿','MANAGER',30);
 
insert into emp02
values (2222,'ȫ�浿','MANAGER',30); 
 
insert into emp02
values (null,'������','SALESMAN',20);  
 
insert into emp02
values (2222,'������','SALESMAN',10);  
--���Ἲ ���� ����(SCOTT.SYS_C0011064)�� ����˴ϴ�
--���Ἲ ���� ����(SCOTT.EMP02_EMPNO_PK)�� ����˴ϴ�
delete from emp02;

 create table emp02(
          empno number(4) constraint emp02_empno_pk primary key, --���������� �츮��Ȯ���Ҽ��ְ� �����ϴ¹�
          ename varchar2(10) constraint emp02_ename_nn not null, --constraint �������Ǹ�     
          job varchar2(9),
          deptno number(2)
 );


create table emp07(
       empno number(4) constraint emp07_empno_pk primary key,
       ename verchar2(9)constraint emp07_empno_nn not null,
       job varchar2(9),
       deptno number(2) constraint emp07_deptno_fk references dept07(deptno)
       );
       
create table dept07(
       deptno number(2) constraint dept07_deptno_pk primary key,
       dname varchar2(20)constraint dept07_dname_nn not null,
       loc varchar2(20)constraint dept07_dname_nn not null
);

select * 
from emp07;
select * 
from dept07;
--������������ ����� ������ ����
insert into dept07
select * 
from dept;

insert into emp07
select empno,ename,job,deptno
from emp;

create table emp08(
empno number(4)primary key,
ename varchar2(10)not null,
sal number(7)constraint emp08_sal_ck check(sal between 500 and 5000),
gender varchar2(2) constraint emp08_gender_ck check(gender in ('M','F'))
);

select* from emp08;

insert into emp08
values(1111,'hong',1000,'M');

insert into emp08--SAL ��������
values(2222,'hong',200,'M');--üũ ��������(SCOTT.EMP08_SAL_CK)�� ����Ǿ����ϴ�

insert into emp08--GENDER ��������
values(3333,'hong',1000,'A');--üũ ��������(SCOTT.EMP08_GENDER_CK)�� ����Ǿ����ϴ�

create table dept08(
       deptno number(2)primary key,
       dname varchar2(10)not null,
       loc varchar2(15)default'SEOUL'
);
select*from dept08;
--default
insert into dept08(deptno,dname)
values (10,'SALES');--SEOUL ���� ���Եȴ�.

insert into dept08(deptno,dname,loc)
values (20,'SALES','BUSAN');

--�������� �������
--�÷� ������ ����

--���̺� ������ ����  1)  ������ �÷����� ,�޸��� �ٿ��ش� �������� �ƴϱ⋚����
--                  2)  ���������� �и��Ͽ� �ۼ�
--                  3)  not null�� ���� �� �� ����.vs �÷� ���������� �����Ѵ�. 
--���̺� ��������� ex)
create table emp09(
       empno number(4),
       ename varchar2(20)constraint emp09_ename_nn not null,
       job varchar2(20),
       deptno number(20),
       
       constraint emp09_empno_pk primary key(empno),
       constraint emp09_job_uk unique(job),
       constraint emp09_deptno_fk foreign key(deptno) references dept(deptno)--�������̶� ,�޸� ����
);

insert into emp09 
values(3333,'hong','PRESIDENT',80);--������ �߻� :SCOTT.EMP09_DEPTNO_FK)�� ����Ǿ����ϴ�- �θ� Ű�� �����ϴ�

--���ձ�(=�⺻Ű�� �ΰ��� �÷��� ����ϴ� ���)
--    1)���̺� ���� ������θ� ���� �����ϴ�
--    2)Alter ���ɾ� �����
create table member(
       name varchar2(10),--�ڿ� primary key�� ��� ���Ѵ�.
       address varchar2(30),
       hphone varchar2(10),
       
       constraint member_name_address_pk primary key(name,address)
       );
       
create table emp10(
       empno number(4),
       ename varchar2(20),
       job varchar2(20),
       deptno number(20)-- ,�޸� ���� �����ϱ�!!
);

alter table emp10--���� ������ ����
add  constraint emp10_empno_pk primary key(empno);

alter table emp10--���� ������ ����
add  constraint emp10_empno_fk foreign key(deptno) references dept(deptno);

--not null�� �������ִ� ����=>modify�� ���(null-> not null)

--modify
alter table emp10--���� ������ ����
modify job constraint emp10_job_nn not null;

alter table emp10--���� ������ ����
modify ename constraint emp10_ename_nn not null;

--drop : �������Ǹ�(constraint) �Ǵ� ��������(primary key)�� ����Ѵ�.
alter table emp10--�������� ����
drop constraint emp10_empno_pk;--or drop  primary key(empno);

create table emp11(--�ڽ�     �θ𲨸��� ������ �ڽĲ� ����
       empno number(4),
       ename varchar2(20),
       job varchar2(20),
       deptno number(20)-- ,�޸� ���� �����ϱ�!!
);

alter table emp11--���� ������ ����
add  constraint emp11_empno_pk primary key(empno);

alter table emp11--���� ������ ����
add  constraint emp11_deptno_fk foreign key(deptno) references dept11(deptno);

create table dept11(--�θ�
       deptno number(2),
       dname varchar2(10),
       loc varchar2(15)
);

alter table dept11
add constraint dept11_deptno_pk primary key(deptno);

insert into dept11
select*
from dept;

insert into emp11
select empno, ename, job, deptno 
from emp;

delete from dept11--ó���� �θ� ������ �� ����   ��) cascads�� ����ϸ� ���� ����
where deptno = 10;--������ ���� '�ڽ� ���ڵ尡 �߰ߵǾ����ϴ�'

alter table dept11--�� �ڵ带 �����ϸ� �θ� ������ �� �ִ�
disable primary key cascade;

alter table dept11--�� �ڵ带 �����ϸ� �θ� ������ �� �ִ�
drop primary key cascade;


--14-1����,ALTER tabel ���ɾ�� ���������� �����ϼ���
create table DEPT_CONST(--�θ����̺�
deptno number(2),
dname varchar2(14),
loc varchar2(13)
);

alter table DEPT_CONST
add constraint DEPT_CONST_deptno_pk primary key(deptno);

alter table DEPT_CONST
add constraint DEPT_CONST_dname_unq unique(dname);

alter table DEPT_CONST
modify loc constraint DEPT_CONST_loc_nn not null;

--14-2���� 
create table emp_const( --�ڽ����̺�
       empno number(4),
       ename varchar2(10),
       job varchar2(9),
       tel varchar2(20),
       hiredate date,
       sal number(7),
       comm number(7),
       deptno number(2) -- ,�޸� ���� �����ϱ�!!
);

alter table emp_const
add constraint emp_const_empno_pk primary key(empno);

alter table emp_const
modify ename constraint emp_const_ename_nn not null;

alter table emp_const
add constraint emp_const_tel_unq unique(tel);

alter table emp_const
add constraint emp_const_sal_chk check(sal between 1000 and 9999);

alter table emp_const
add constraint emp_const_deptno_fk foreign key(deptno)references dept_const(deptno);

-------------------------��(view)-----------------------
--p.338

--��--
--�̸�	            ����	           SQL
--Create	        ����	           INSERT
--Read             �б�(�Ǵ� ����)   SELECT
--(=Retrieve)  	
--Update 	        ����            UPDATE
--Delete           ����(�Ǵ� �ı�)   DELETE
--(=Destroy)	

--��ü : create�� ��������°�  ex)table, index,view
--create or replace view + �����̺���[alias]  [ ]:���û��� �ʼ��ƴ�
--as
--��������(select=��ø�Ǵºκ�)
--[with check option]
--[with read only]

create table dept_copy
as
select*
from dept;

create table emp_copy--����Ǵ� ���̺��� ���������� �� �Ѿ�´�.
as
select*
from emp;

alter table emp_copy--�������� ����
add CONSTRAINT emp_copy_deptno_fk foreign key(deptno)references dept(deptno);

select * from emp;  --14��
select * from emp_copy;--14��

create or replace view emp_view30--system ���̺��� ������ ���� �������� �Ѵ�.�ý��� ���̺��� grant create view--view30 to scott �ۼ��Ѵ�.
as
select empno,ename,sal,deptno 
from emp_copy
where deptno = 30;

select*
from emp_view30;

insert into emp_view30--�������̺��� �� �ִ�
values (1111,'hong',1000,30);

select*--�������̺�
from emp_copy;

insert into emp_view30(empno,ename,sal)--�������̺��� �� �ִ�
values (2222,'hong',2000);

select*
from emp_view30;

select*
from emp_copy;

insert into emp_view30(empno,ename,sal,deptno)
values (2222,'hong',2000,50);

create or replace view emp_view(�����ȣ,�����,�޿�,�μ���ȣ)
as
select empno,ename,sal,deptno
from emp_copy;

select*
from emp_view
where �μ���ȣ=20;--emp_view(�����ȣ,�����,�޿�,�μ���ȣ)��Ī���� �߱⋚���� �ѱ۷� �Ѵ�.

create or replace view emp_dept_view
as
select empno,ename,sal,e.deptno,dname,loc
from emp e inner join dept d
on e.deptno = d.deptno
order by empno desc;

select*
from emp_dept_view;--empnp�� ��������

---------------------------------------------------10.25-------------------
--5������ ��� ��� ����

--�μ��� �ּұ޿��� �ִ�޿�,dname min_sal max_sal
create or replace view sal_view --��簴ü�� �̸��� �ߺ��� �� ������ or replace ������ select�� ����'avg(sal)'�� �߰��ؼ� �ٽ� ���̺����� �����ϴ�.
as
select dname, min(sal) as min_sal, max(sal) as max_sal,avg(sal) as avg_sal
from emp e inner join dept d 
on e.deptno = d.deptno
group by d.dname;--�μ���

select*
from sal_view;

drop view sal_view;

--with check option
create or replace view view_chk30
as
select empno,ename,sal,comm,deptno
from emp_copy
where deptno = 30 with check option;--�������� �÷��� �������� ���ϰ��Ѵ�.

update view_chk30
set deptno = 10;--with check option;--�������� �÷��� �������� ���ϰ��Ѵ�.

--with read only
create or replace view view_read30
as
select empno,ename,sal,comm,deptno
from emp_copy
where deptno = 30 with read only;--��� �÷��� ���� crud�� c,u,d�� �Ұ���(��ȸ�� �����ϴ�) read�� �����ϴ�

update view_read30
set deptno = 10;--�б� ���� �信���� DML �۾��� ������ �� �����ϴ�=>with read only;�̰� ������

--���� Ȱ��
--TOP - N ��ȸ�ϱ�
--Rownum(�ǻ��÷�) 
select * 
from emp;

--�Ի����� ���� ���� 5���� ����� ��ȸ
select *--���� ��ȸ
from emp
order by hiredate asc;
--1��° ���
select *
from emp
where hiredate <='81/05/01'; 

--2��° ��� 
select rownum,empno,ename,hiredate
from emp
where rownum <=5;

--order by�� �̿��� ������� �� ���̺�����
create or replace view view_hiredate
as
select empno,ename,hiredate
from emp
order by hiredate asc; 

select*
from view_hiredate;

select rownum,empno,ename,hiredate
from view_hiredate
where rownum <= 5;

--2��°~5��° ��ȸ�غ���
select rownum,empno,ename,hiredate
from view_hiredate
where rownum between 2 and 5;--rownum�� �������� ���� �ݵ�� 1�� �����ϴ� ������ ������ �Ѵ�.

create or replace view view_hiredate_rm
as
select rownum rm,empno,ename,hiredate  --rm�� �߰��� ��Ī���� �ϸ� 1�� �����ϴ� ������ ����� �ִ�.
from view_hiredate;

--2��°~5��° ��ȸ�غ���
select rm,empno,ename,hiredate
from view_hiredate_rm
where rm >1 and rm <=5;--(=where rm between 1 and 5)

----2��°~5��°�� 
--�ζ��κ�� ǥ�����
select rm,b.*--(=empno,ename,hiredate)
from(select rownum rm,a.*--(=empno,ename,hiredate)  
     from(select empno,ename,hiredate 
          from emp
          order by hiredate asc
          )a
     )b
    where rm > 1 and rm<=5;


--�Ի����� ���� ���� 5���� ��ȸ �ζ��κ��
select empno,ename,hiredate  
from(select empno,ename,hiredate 
     from emp
     order by hiredate asc
     )    
where rownum <=5; 

----------------------------------������
--�ڵ����� ��ȣ�� ������Ű�� ��ɼ���
--create-����,drop-����
--nextval,currval

--create sequence ��������
--start with    ���۰� =>1�� �⺻��
--increment by  ������ =>1�� �⺻��
--maxvalue      �ִ밪 =>10�� 1027
--minvalue      �ּҰ� =>10�� -1027

create sequence dept_deptno_seq
increment by 10
start with 10;

select dept_deptno_seq .nextval--���� �� �� ���� ����
from dual;

select dept_deptno_seq .currval--���� �� Ȯ��
from dual;

create sequence emp_seq
start with 1
increment by 1
maxvalue 1000;

drop table emp01;

create table emp01
as
select empno,ename,hiredate 
from emp
where 1!=1;

select* from emp01;

insert into emp01
values (emp_seq.nextval,'hong',sysdate);--���� �� �� ���� ����