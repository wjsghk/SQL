--DQL(질의하는 어=물어보는,데이터 조회한다)
--select  컬럼 명
--from 테이블 명

--전체데이터
select empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp; 

select * 
from emp;

--부분 3개 데이터
select empno,ename,sal
from emp;

--부분 1개 데이터
select deptno
from emp;

select DISTINCT(deptno)--중복된건 제외
from emp;

select job
from emp;

select DISTINCT(job)
from emp;
--데이터를 통해서 연산자 사용할 수 있다.-,+,/,*
--컬럼대상으로 연산한다
--null값은 연산이 불가하다.
--컬럼에 별칭을 사용할 수 있다.
select ename as 사원명 ,sal,sal*12+nvl(comm,0)as 연봉,comm--(comm,0)= comm이 0으로 한다
from emp;--as연봉=> sal*12+nvl이 부분이 연봉으로 이름이 바뀐다


----------------------------------------------------------------10.18일
--order by=> 정렬기준이 되는 값 ex)asc(오름차순)/desc(내림차순)
select * 
from emp 
order by sal asc;--오름차순은 생략이 가능하다 =>생략된 상태면 오름차순으로 실행된다
--숫자(1~10),날짜(과거날짜~최신날짜), 문자(사전순서대로),

--------------------------------------조건검색,연산자,
--select컬럼명, from테이블형, where 조건식(컬럼명 =값)ex <,>,=,!=,/,<=,>=,and,or
select * 
from emp
where sal >=3000; --급여가 3000이상인 사원들 출력

select *
from emp
where deptno =30;--deptno가 30인 사원들

--and는 두가지 조건이 모두 참인 경우 쓴다
select *
from emp               --오라클에서는 ''로 문자열쓴다
where deptno =30 and  job = 'SALESMAN'and  empno = 7499;

select *
from emp
where ename = 'FORD';
--소문자 ford는 없고 대문자 FORD가 있어서 출력할때 안나온다 


-------------------------날짜를 조건절에 사용할 때
------------------날짜도 크기 비교가 있고, ''을 사용한다
select *
from emp
where hiredate < '1982/01/01';


----------------or은 두개이상의 조건중에 하나이상 참인 경우
select *
from emp
where deptno = 10 or sal >=2000;


-------------------not 논리부정 연산자 1번째 방법 (!=)
select *
from emp
where sal !=3000;
--2번째 방법 (not)
select *
from emp 
where not sal = 3000;


----------------------and,or 범위 조건을 표현 할 때 사용
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
--in 을 써서 위 코드와 동일한 결과 값이 나온다
select *
from emp
where sal in(800,3000,5000);

--------------------like은 값의 일부만 가지고 데이터를 조회한다.
--와일드 카드를 사용한다(%,_) %는 모든 문자를 대체,, _는 한 문자를 대체한다
select *
from emp
where ename like 'F%';--이름이 F로 시작하는 사람들 출력

select *
from emp
where ename like '%D';--이름이 D로 끝나는 사람들 출력

select *
from emp
where ename like '%O%';--이름이 시작 또는 끝이 O(대문자)로 되는 사람들 출력

select *
from emp
where ename like  '___D'; -- _(언더바)3글자이면서 마지막글자 D인 사람들 출력

select *
from emp
where ename like 'S__%';--S로 시작 하고 언더바 2개 이상인 사람들 <= % 때문에

---------------------- null 연산자 (is null/is not null)
select *
from emp
where comm is null;

-----------------------------집합연산자
--차집합(MINUS),합집합(UNION),교집합(INTERSECT)
--처음select에 ;를 안쓴다
--2개의 select구문을 사용,컬럼의 갯수가 동일,컬럼의 타입이 동일,컬럼의 이름은 상관없다.

--합집합
select empno,ename,sal,deptno
from emp
where deptno = 20
UNION 
select empno,ename,sal,deptno
from emp
where deptno = 10;
--중복은 출력안되지만 All 사용하면서 중복된것도 출력된다
select empno,ename,sal,deptno
from emp
where deptno = 10
UNION ALL
select empno,ename,sal,deptno
from emp
where deptno = 10;

--차집합
select empno,ename,sal,deptno
from emp 
MINUS 
select empno,ename,sal,deptno
from emp
where deptno = 10;

--교집합
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

--전체데이터
select empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp; 

select * 
from emp;

--부분 3개 데이터
select empno,ename,sal
from emp;

--부분 1개 데이터
select deptno
from emp;

select DISTINCT(deptno)--중복된건 제외
from emp;

select job
from emp;

select DISTINCT(job)
from emp;
--데이터를 통해서 연산자 사용할 수 있다.-,+,/,*
--컬럼대상으로 연산한다
--null값은 연산이 불가하다.
--컬럼에 별칭을 사용할 수 있다.
select ename as 사원명 ,sal,sal*12+nvl(comm,0)as 연봉,comm--(comm,0)= comm이 0으로 한다
from emp;--as연봉=> sal*12+nvl이 부분이 연봉으로 이름이 바뀐다


----------------------------------------------------------------10.18일
--p.85~

--order by=> 정렬기준이 되는 값 ex)asc(오름차순)/desc(내림차순)
select * 
from emp 
order by sal asc;--오름차순은 생략이 가능하다 =>생략된 상태면 오름차순으로 실행된다
--숫자(1~10),날짜(과거날짜~최신날짜), 문자(사전순서대로),

--------------------------------------조건검색,연산자,
--select컬럼명, from테이블형, where 조건식(컬럼명 =값)ex <,>,=,!=,/,<=,>=,and,or
select * 
from emp
where sal >=3000; --급여가 3000이상인 사원들 출력

select *
from emp
where deptno =30;--deptno가 30인 사원들

--and는 두가지 조건이 모두 참인 경우 쓴다
select *
from emp               --오라클에서는 ''로 문자열쓴다
where deptno =30 and  job = 'SALESMAN'and  empno = 7499;

select *
from emp
where ename = 'FORD';
--소문자 ford는 없고 대문자 FORD가 있어서 출력할때 안나온다 


-------------------------날짜를 조건절에 사용할 때
------------------날짜도 크기 비교가 있고, ''을 사용한다
select *
from emp
where hiredate < '1982/01/01';


----------------or은 두개이상의 조건중에 하나이상 참인 경우
select *
from emp
where deptno = 10 or sal >=2000;


-------------------not 논리부정 연산자 1번째 방법 (!=)
select *
from emp
where sal !=3000;
--2번째 방법 (not)
select *
from emp 
where not sal = 3000;


----------------------and,or 범위 조건을 표현 할 때 사용
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
--in 을 써서 위 코드와 동일한 결과 값이 나온다
select *
from emp
where sal in(800,3000,5000);

--------------------like은 값의 일부만 가지고 데이터를 조회한다.
--와일드 카드를 사용한다(%,_) %는 모든 문자를 대체,, _는 한 문자를 대체한다
select *
from emp
where ename like 'F%';--이름이 F로 시작하는 사람들 출력

select *
from emp
where ename like '%D';--이름이 D로 끝나는 사람들 출력

select *
from emp
where ename like '%O%';--이름이 시작 또는 끝이 O(대문자)로 되는 사람들 출력

select *
from emp
where ename like  '___D'; -- _(언더바)3글자이면서 마지막글자 D인 사람들 출력

select *
from emp
where ename like 'S__%';--S로 시작 하고 언더바 2개 이상인 사람들 <= % 때문에

---------------------- null 연산자 (is null/is not null)
select *
from emp
where comm is null;

-----------------------------집합연산자
--차집합(MINUS),합집합(UNION),교집합(INTERSECT)
--처음select에 ;를 안쓴다
--2개의 select구문을 사용,컬럼의 갯수가 동일,컬럼의 타입이 동일,컬럼의 이름은 상관없다.

--합집합
select empno,ename,sal,deptno
from emp
where deptno = 20
UNION 
select empno,ename,sal,deptno
from emp
where deptno = 10;
--중복은 출력안되지만 All 사용하면서 중복된것도 출력된다
select empno,ename,sal,deptno
from emp
where deptno = 10
UNION ALL
select empno,ename,sal,deptno
from emp
where deptno = 10;

--차집합
select empno,ename,sal,deptno
from emp 
MINUS 
select empno,ename,sal,deptno
from emp
where deptno = 10;

--교집합
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


---------------------------------오라클 함수
--소문자 ,대문자 둘 다 출력된다
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
-------------길이
select ename,length(ename)
from emp;
---------------substr
select 'Welcome to Oracle',substr('Welcome to Oracle',1,3)--1~3번째까지를 출력한다
from dual;--Wel 출력된다
select 'Welcome to Oracle',substr('Welcome to Oracle',-17)-- -17번째부터 출력한다
from dual;--Welcome to Oracle 출력

select instr('Welcome to Oracle','o')-- o의 위치를 찾는다
from dual;--5가 출력

select instr('Welcome to Oracle','o',6)-- 6번째를 시작으로하고 다음 o의 위치가 10이다
from dual;--10이출력

select instr('Welcome to Oracle','e',3,2)-- 3번째를 시작으로하고 두번째 e의 출력된다
from dual;--17이 나온다

-----------replace
select 'Welcome to Oracle',replace ('Welcome to Oracle','to','of')-- to를 of 로 바꿔준다
from dual;

-----------LPAD, RPAD
select 'oracle',lpad('oracle',10,'#'),rpad('oracle',10,'*'),lpad('oracle',10)
from dual;--####oracleoracle****    oracle

select rpad('990103-',14,'*')
from dual;--990103-*******

----------------------------10.19일-----------------------------------------
--p.146~
----------------------------날짜함수 --------------------
select sysdate -1 어제, sysdate, sysdate +1 내일
from dual;--22/10/18	22/10/19	22/10/20
----근무일수
select sysdate - hiredate as 근무일수 --차이가 일수 반환
from emp;

----근속년수
select trunc ((sysdate - hiredate)/365) as 근속년수 
from emp;--41  trunc 사용하면서 소수점 삭제된다
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
round(sysdate,'cc')as  CC,--네자리 연도 끝 두자리 기준
round(sysdate,'yyyy')as  yyyy, --연원일의 7월 1일 기준
round(sysdate,'Q')as q,--두번째 달의 16일기준
round(sysdate,'DDD')as dd,--해당 일의 정오기준
round(sysdate,'HH')as hh-- 해당일 기준
from dual;

------------------------자료형 변환 함수-------------------------
--to_char()
--to_number()
--to_date()

--날짜를 문자로
select sysdate,to_char(sysdate,'YYYY-MM-DD HH24:MI:SS')as 현재시간
from dual;--22/10/19	2022-10-19 11:02:21

select hiredate,to_char(hiredate,'YYYY-MM-DD HH24:MI:SS')as 현재시간
from emp;--80/12/17	1980-12-17....

--숫자를 문자로
select to_char(123456,'999,999')
from dual;-- 123,456
select to_char(sal,'L999,999')
from emp;

--문자를 숫자로
select 20000-10000 --묵시적형(=자동형)변환
from dual;

select '20,000'-'10,000' --오류가 난다 =>to_number()형변환을 해줘야한다.
from dual;
select to_number('20,000','999,999')- to_number('5,000','999,999')
from dual;

--문자를 날짜로
select to_date('20221019','YYYY/MM/DD')
from dual;--22/10/19

select *
from emp
where hiredate < to_date(' 19820101','YYYY-MM-DD');

----------------------null처리함수----------------------------------
--null데이터처리
--nvl(null,바꾸고 싶은데이터)
--nvl은 null 데이터의 타입과 같은 타입으로 변경해줘야한다.
--nvl(숫자,숫자),nvl(문자,문자)

select ename 사원명,sal,sal*12+nvl(comm,0) as 연봉,comm
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

------------------------------조건문 표현하는 함수-----------------------------
--조건문 표현하는 함수
--decode()->switch
--case    ->if

select ename,job,deptno,
decode(deptno,10,'AAA' ,20,'BBB' ,30,'CCC' ,'기타')as 부서명
from emp;

--case문 예시,범위를 조건식으로 설정 할 수 있다.
--case 
--  when'조건식'  then'실행문'
--  when'조건식'  then'실행문'
--  when'조건식'  then'실행문'
--  else'실행문'
--end as 000

select ename,job,deptno,--위에 decode와 같은 값이 출력된다
case 
  when deptno =10  then 'AAA'
  when deptno =20  then 'BBB'
  when deptno =30  then 'CCC'
  else'기타'
  end as 부서명
from emp;

select ename,job,sal,
case 
  when sal between 3000 and 5000 then'임원'
  when sal >=2000 and sal <3000 then'관리자'   
  when sal >=500 and sal<2000 then'사원'
    else'기타'
    end as 직무
from emp;

--6-1문제
select empno,rpad(substr(empno,1,2),4,'*')as MASKING_ENPNO,
       ename,
       rpad(substr(ename,1,1),length(ename),'*')as MASKING_ENAME
  from emp
 where length(ename) >=5 --length 문자열구하기
   and length(ename) < 6;
--6-2문제
select empno,ename,sal,
      trunc(sal/21.5,2) as day_pay,--하루일당 월급에 21.5 나누고  소수점 2째 짜리까지 살리고 3번째자리에서 반올림한다. 
      round(sal/21.5/8,1)as TIME_PAY--시간당시급 21.5/8 나누고 소수점 1째자리까지 출력 2번째자리에서 반올림
      from emp;
      
--6-4문제
select empno,ename,mgr,
case
when mgr is null then '0000'
when substr(mgr,1,2)='78' then'8888' --1번째 시작해서2번째까지 78인 사원은 8888
when substr(mgr,1,2)='77' then'7777'
when substr(mgr,1,2)='76' then'6666'
when substr(mgr,1,2)='75' then'5555'
else to_char(mgr)
end as chg_mgr
from emp;

------------------------다중행함수--------------------------
--일반컬럼과 같이 쓸 수 없다,
--크기비교가 가능 모두 타입에 사용가능
--sum: 00열 값을 모두 합한 결과 값이 하나의 행으로 출력된다.
select sum(sal)
from emp;
--avg:00열 값을 합한 평균 결과 값이 하나의 행으로 출력된다.
select avg(sal)
from emp;
--count:전체 레코드 개수가 출력된다.
select count(*),count(comm)
from emp;
--max:지정한 데이터 중 최대값출력 <-> min
select max(sal),min(sal)
from emp;

select ename max(sal)
from emp;--오류가 난다 <=ename은 개수가14 != max(sal)은 개수가 1개여서 미스매칭

select min(hiredate)--입사일 가장 빠른사람<->max 입사가 가장 최근인 사원
from emp;
where deptno =20;--부서인원이 20명중

-------암기사항--------------------------------------
--select 컬럼명(열)
--from 테이블명
--where 조건식(그룹합수 사용불가/반드시 group by,having보다 먼저실행!!)
--group by 컬럼명
--having 조건식(그룹함수 사용한다)
--order by 컬럼명 정렬방식=>맨 마지막에 작성한다

------------------------group by절---------------------------------
--각 부서의 평균 값을 한번에 출력 ,      아래와 차이점: 하나하나 지정 해야된다
select avg(sal) from emp where deptno =10
union
select avg(sal) from emp where deptno =20
union
select avg(sal) from emp where deptno =30; 
--group by를 이용한 평균값 한번에 출력,   위에와 차이점: 한번에 가능하다
select avg(sal),deptno    --출력값이 3개 동일해서 오류가 안나온다.
from emp
group by deptno;

select avg(sal),deptno,job
from emp
group by deptno,job
order by deptno,job desc;-- 전체가 정렬되고 job은 내림차순으로 정렬된다.

-------------------------------having절--------------------------
select  deptno,avg(sal)
from emp
group by deptno
having avg(sal) >= 2000;    --group by의해서 조회 결과에 조건을 준다,\
                            --조건식을 작성할 때 그룹함수를 사용한다. 

-------------------------------10.20일-------------------------------------
--p215~
--------------------조인(join)
--2개이상의 테이블에서 데이터를 조회
--from절에 두개이상의 테이블을 작성한다.
--join할때 where에 작성을 해야 한다.
--cross join : 사용은 안함(where절 없이 조인함)
--equi join : 제일 많이 사용됨(where절 사용 등가연산자 : =)
--non equi join : (where 범위연산자 : and ,or)
--self join : where 하나의 테이블을 사용한다.
--out join  :  (=외부조인)등가시 누락되는 데이트를 같이 조회 하기위해서 사용 (+)를 사용한다

select emp.ename,emp.job,emp.deptno,dept.dname,dept.loc--dname 부서이름, loc 근무지
from emp,dept
where emp.deptno=dept.deptno;

select ename,job,e.deptno,dname,loc--양쪽에 이름이 같을 때 컬럼은 소속을 밝혀줘야한다.ex)deptno가 같이 사용됨
from emp  e,dept  d--테이블에 별칭 e, d 를 쓰면서 where절에도 emp->e ,dept->d로 바꿔준다
where e.deptno=d.deptno;  --select의 별칭설정은 4가지 vs from절 별칭은 한 칸 띄어쓰기 사용한다.

--equi join
select ename,job,e.deptno,dname,loc,sal
from emp  e,dept  d
where e.deptno=d.deptno
and sal >=3000;  

--non equi join
select ename,sal,grade,losal,hisal
from emp e,salgrade s
where e.sal bewteen s.losal and s.hisal;--  between and 절 사용 밑에꺼와 동일한 결과 값을 출력한다.
--where e.sal >= s.losal and  e.sal <= s.hisal;--non equi join절 사용

--사번,이름,급여, /부서번호 ,부서명, /급여등급
--emp에 위치     /dept에 위치      /salgrade

select empno,ename,sal,d.deptno,dname,grade
from emp e,dept d, salgrade s
where e. deptno = d.deptno
and e.sal between s.losal and s.hisal;

----self join  --하나의 테이블을 2개로 분리한다고 생각
select e.empno ,e.ename,e.mgr,m.ename
from emp e,emp m--반드시 별칭부여
where e.mgr = m.empno;

select ename,deptno
from emp
where deptno =20;
--SMITH	20
--JONES	20
--SCOTT	20
--ADAMS	20
--FORD	20


--scott와 같은 부서에 근무하는 사원 -self join 으로 출력해보기
--ename  ename 
--scott  simth
--scott  JONES
--scott  ADAMS
--scott  FORD                     
select  work.ename , friend.ename-- work->w, friend->f 로 별칭해서 가능
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
from emp e,emp m --밑에 코드와 deptno의 40을 제외하고 값은 결과다
where e.mgr = m.empno(+);--데이터가 없는 테이블쪽에 (+)를 붙인다.=>king이 나오게된다

select ename,sal,d.deptno,dname
from emp e,dept d
where e.deptno(+) = d.deptno; --(+)를 사용하면서 =>deptno의 40이 출력된다.
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


-------ANSI-JOIN(표준조인방식)
--cross join, natural join : 잘 사용안한다
--inner join(equi,non equi,self join)
--outer join((+)) [left or right or full] outer join

--inner join
select ename,sal,dname,loc
from emp e inner join dept d
using(deptno) --양쪽 테이블의 컬럼명이 동일한경우
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
from emp e inner join salgrade s--inner join을 쓸경우 on 형태가 따라온다.
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
from emp e left outer join emp m --데이터가 있는 쪽을 지정한다.
on e.mgr = m.empno;--null 킹값이 나온다
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
--ANSI join 방식으로 위와 같은 결과값 출력
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

--8-1문제
select d.deptno, d.dname , e.empno, e.ename, e.sal
from emp e, dept d
where e.deptno= d.deptno
and e.sal>2000;
--inner 방식으로
select d.deptno, d.dname , e.empno, e.ename, e.sal
from emp e inner join dept d
on e.deptno= d.deptno
where e.sal>2000;


--8-2문제
select d.deptno,d.dname, --콤마(,)표시 하기
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

--8-3문제
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
  FROM EMP E, DEPT D
 WHERE E.DEPTNO(+) = D.DEPTNO
ORDER BY D.DEPTNO, E.ENAME;

SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
  FROM EMP E right outer join DEPT D--e.deptno 포함시킨다??
  on e.deptno = d.deptno
  order by d.deptno, e.ename;


--8-4문제
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
   
   --------------------------------서브쿼리--------------------------------
   
   --select 구문을 중첩해서 사용하는 것(where)
   select ename,max(sal)
   from emp;--개수차이(여러개,1개)가 나서 오류가 난다
   
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
   
   select dname--메인 쿼리
   from dept
   where deptno =(select deptno--서브쿼리
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


--자신의 직속상관이 king 인 사원의 이름과 급여를 조회하세요.
select ename,sal,mgr
from emp
where mgr =(select empno
            from emp
            where ename = 'KING');
--JONES	2975
--BLAKE	2850
--CLARK	2450

----다중행서브쿼리----------------p254
-- in   : 결과중에 하나가 만족하면된다.
-- >any : 결과중에 가장 작은값보다 크면된다
-- >all : 결과중에 가장 큰값 보다 크면된다.
select*
from emp
where sal in (5000,3000,2850);
--위와 같은 값 출력된다.

select*
from emp
where sal >any ( -- '<any'를 in으로 바꿔도 같은 값이 나온다.의미는가장 큰값보다 작은값  <-->  '>' 가장 작은값보다 큰값
              select max(sal)
              from emp
              group by deptno);
--7566	JONES	MANAGER	7839	81/04/02	2975		20
--7788	SCOTT	ANALYST	7566	87/04/19	3000		20
--7839	KING	PRESIDENT		81/11/17	5000		10
--7902	FORD	ANALYST	7566	81/12/03	3000		20 

select ename,sal,deptno
from emp 
where sal > all (select sal  --all 가장큰값보다 큰값 <--> '<all'최소급여보다 더 적은 값
                 from emp
                 where deptno = 30);
              
-----다중열 서브쿼리
select*
from emp
where (deptno,sal) in (select deptno,max(sal)
                       from emp
                       group by deptno);




------------------------------------------10.21------------------------------
--p.266~

--DML(데이터조작어) : insert, update , delete
--insert : 테이블에 데이터 삽입
--insert into 테이블명 (컬럼명1,컬럼명2,...)
--values (값1,값2....)
--컬럼과 값의 타입과 갯수가 일치해야 한다.( 1 : 1 )
--작성 순서대로 1:1매칭된다

create table dept_temp
as
select * from dept;

select *
from dept_temp;

insert into dept_temp(deptno,dname,loc)
values(50,'DATABASE','SEOUL');--'50 DATABASE SEOUL'가 dept_temp테이블에 추가됨

insert into dept_temp(deptno,dname)--2개만 넣고 싶은경우 loc는 null로 삽입된다
values(60,'JSP');--null의 묵시적 삽입

insert into dept_temp--컬럼생략 될 때 => 3개의 열을 똑같이 행이 삽입된다.
values(70,'HTML','SEOUL');

insert into dept_temp--컬럼생략, 명시적 null데이터 삽입
values(80,'null','SEOUL');-- => 3개의 열을 똑같이 행이 삽입된다.

create table emp_temp
as
select * from emp
where 1 != 1;

select *
from emp_temp;

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(9999,'홍길동','PRESIDENT',null,'2001/01/01',5000,1000,10);

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values (3111,'심청이','MANGER',9999,sysdate,4000,null,30);

-------------update
--update : 컬럼의 데이터를 변경(수정)
--update 테이블명
--set 컬럼명 =값,컬럼명 =값,....
--where 조건식
--조건절을 사용하지 않으면 해당 컬럼이 모두 변경된다.

create table dept_temp2
as 
select * 
from dept;

select* 
from dept_temp2;

update dept_temp2
set loc = 'SEOUL';--=>loc부분이 다 서울로 바뀐다.

rollback;--=>다시 원상 복구

update dept_temp2
set dname = 'DATABASE',loc = 'SEOUL'
where deptno =40;--=>40번부서에서만 위에 2개가 바뀐다.

----------delete
--delete(데이터삭제)
--delete from 테이블명
--where 조건식
--조건절을 사용하지 않으면 모든 데이터가 삭제된다.

create table emp_temp2
as
select *
from emp;--=> 생성

select *
from emp_temp2;--=>확인

delete from emp_temp2;--  ==>emp_temp2가 삭제된다.
drop table emp_temp2;--=>테이블 완전삭제
rollback;--

delete from emp_temp2
where ename = 'SCOTT';--=>scott만 삭제됨


-------------------------------------------------트랜잭션
------------------------------TCL(데이터의 영구저장 또는 취소)
--트랜젝션
--commit,rollback,savepoint
--commit 1) 데이터 영구 저장(테이블이 데이터 반영)
--       2) create 구문을 사용해서 객체생성할때 (자동) 
--rollback 1) 데이터 변경 취소(테이블이 데이터 미반영)=원상복구
--         2) 천재지변,전쟁(자동)
--savepoint : 

create table dept01
as 
select *
from dept;

select *
from dept01;

delete from dept01;--=>명령프롬프트에 기록 남아있음.
drop table dept01;
commit;--=> 명령 프롬프트에서 기록삭제 완료됨

rollback;-->commit 이 한번 일어나면 coommit 지점으로 돌아가서 삭제된 기록이 복구는 안된다!!!

truncate table dept01;-->데이터영구삭제가 되고 롤백이 되도 데이터를 불러올 수 없다.


--------------------------------DDL(데이터정의어)-----------------
--DDL(데이터 정의어) : table 모든 객체를 생성,삭제,변경하는 명령어
--create-생성,alter-변경,drop-삭제,

--create table 테이블명(  --table(객체)
--          컬럼명1 타입, --column(속성)
--          컬럼명2 타입,
--          컬럼명3 타입   마지막에는 ,를 빼준다!!
--                       );

create table emp_ddl(
   --속성(사번,이름,직책,관리자,입사일,급일,급여,성과금,부서번호)
   empno number(4),
   ename varchar2(10), --크기는 다 byte
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
values (9999,'이순신','MANGER',1111,sysdate,1000,null,10);

create table dept_ddl--테이블의 복사하는용(백업or 테스트)
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
where 1 != 1;  -- 이 조건문의 의미는 있을 수 없는거여서  테이블의 구조만 복사한다.

------------테이블 변경(컬럼의 정보 수정)
--alter
--새로운 컬럼추가,컬럼의 이름 변경,자료형의 변경,컬럼을 삭제

create table emp_alter
as
select * from emp;

select * from emp_alter;

alter table emp_alter
add address varchar2(100);--=> emp_alter테이블에 address주소가 추가됨

alter table emp_alter
rename column address to addr;--address주소가 addr로 변경

alter table emp_alter
modify empno number(10);--=>emp_hw에 열 클릭하면 10으로 변경됨

alter table emp_alter-- addr의 행이 삭제됨
drop column addr;

--12-1문제
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

--12-2문제
alter table emp_hw
add BIGO varchar2(20);

--12-3문제
alter table emp_hw
modify BIGO VARCHAR2(30); 

--12-4문제
alter table emp_hw
rename column BIGO to remark;

--12-5문제
insert into emp_hw
select empno,ename,job,mgr,hiredate,sal,comm,deptno,null
from emp;

rollback;

select * from emp_hw;

drop table emp_hw;

----------------------------------------데이터사전
desc user_tables; --정보확인용

select table_name
from user_tables; --정보확인용

select owner,table_name
from all_tables;

------------------인덱스
--index : (검색속도를 향상시키기위해 사용 객체)
--index create-생성, drop-삭제
--select 구문의 검색속도를 향상 시킨다
--전체 레코드의 3%~5%정도일때 
--index객체를 컬럼에 생성해서 사용한다.

--create index 인덱스명
--on 테이블명(컬럼명);

create table emp01
as
select* from emp;

select * from emp01;--데이터 917,504까지 데이터 추가

insert into emp01
select * from emp01;

insert into emp01(empno,ename)
values(1111,'bts');

--index 객체를 생성하기전 (0.034)
select empno,ename
from emp01
where ename = 'bts';

--index생성
create index idx_emp01_ename
on emp01(ename);

--index 객체를 생성하기 후 (0.005~0.001)
select empno,ename
from emp01
where ename = 'bts';
drop table emp01;
drop index idx_emp01_ename; --index 삭제 scott에 인덱스 emp01이 삭제됨

--테이블 삭제후 원복 하는법
--show recyclebin;(휴지통역활)지워진거 보기

show recyclebin;

FLASHBACK table emp01
to before drop; --삭제된거 복구

purge recyclebin; --휴지통 삭제

-------------------------------------10.24-------------------------------------

-----------------------------------제약조건-----------------------
--p.360
--제약조건(무결성) : 잘못된 값이 데이터로 사용되는것을 못하게 하는것
--데이터 무결성 : 데이터의 정확성과 일관성 보장

-- not null : 지정한 열에 null값을 허용안함
 -- unique  --> 중복은 허용안함 
 -- primary key(기본키)(=not null+unique 둘 다 제약)
 -- foreign key(외래키=참조키)
 -- 1. 부모와 자식의 관계를 가지는 자식쪽 테이블에 설정한다.
 -- 2. 부모쪽 테이블의 컬럼은 반드시 primary key 또는 unique해야 한다.
 -- 3. null 데이터를 허용한다.
 -- check
 --default
 
 -- emp,dept
 
 
 
 insert into emp
 values (1111,'aaa','MANAGE',9999,SYSDATE,1000,NULL,50);
 
 drop table emp02;
 
 create table emp02(--테이블,열의 틀을 만든다고 생각
          empno number(4) primary key, -- (not null + unique) =primary key  
          ename varchar2(10) not null, -->not null로 제약조건을 검
          job varchar2(9),
          deptno number(2)
 );
 --기본키 사번번호로 구별함
insert into emp02--열의 데이터를 삽입 생각vs create와 비교
values (1111,'홍길동','MANAGER',30);
 
insert into emp02
values (2222,'홍길동','MANAGER',30); 
 
insert into emp02
values (null,'김유신','SALESMAN',20);  
 
insert into emp02
values (2222,'옥동자','SALESMAN',10);  
--무결성 제약 조건(SCOTT.SYS_C0011064)에 위배됩니다
--무결성 제약 조건(SCOTT.EMP02_EMPNO_PK)에 위배됩니다
delete from emp02;

 create table emp02(
          empno number(4) constraint emp02_empno_pk primary key, --제약조건을 우리가확인할수있게 변경하는법
          ename varchar2(10) constraint emp02_ename_nn not null, --constraint 제약조건명     
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
--서브쿼리문을 사용한 데이터 삽입
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

insert into emp08--SAL 제약조건
values(2222,'hong',200,'M');--체크 제약조건(SCOTT.EMP08_SAL_CK)이 위배되었습니다

insert into emp08--GENDER 제약조건
values(3333,'hong',1000,'A');--체크 제약조건(SCOTT.EMP08_GENDER_CK)이 위배되었습니다

create table dept08(
       deptno number(2)primary key,
       dname varchar2(10)not null,
       loc varchar2(15)default'SEOUL'
);
select*from dept08;
--default
insert into dept08(deptno,dname)
values (10,'SALES');--SEOUL 값도 삽입된다.

insert into dept08(deptno,dname,loc)
values (20,'SALES','BUSAN');

--제약조건 설정방식
--컬럼 레벨의 설정

--테이블 레벨의 설정  1)  마지막 컬럼에도 ,콤마를 붙여준다 마지막이 아니기떄문에
--                  2)  제약조건을 분리하여 작성
--                  3)  not null을 적용 할 수 없다.vs 컬럼 레벨에서만 적용한다. 
--테이블 레벨방식의 ex)
create table emp09(
       empno number(4),
       ename varchar2(20)constraint emp09_ename_nn not null,
       job varchar2(20),
       deptno number(20),
       
       constraint emp09_empno_pk primary key(empno),
       constraint emp09_job_uk unique(job),
       constraint emp09_deptno_fk foreign key(deptno) references dept(deptno)--마지막이라 ,콤마 생략
);

insert into emp09 
values(3333,'hong','PRESIDENT',80);--오류가 발생 :SCOTT.EMP09_DEPTNO_FK)이 위배되었습니다- 부모 키가 없습니다

--복합기(=기본키를 두개의 컬럼을 사용하는 경우)
--    1)테이블 레벨 방식으로만 적용 가능하다
--    2)Alter 명령어 사용방식
create table member(
       name varchar2(10),--뒤에 primary key를 사용 못한다.
       address varchar2(30),
       hphone varchar2(10),
       
       constraint member_name_address_pk primary key(name,address)
       );
       
create table emp10(
       empno number(4),
       ename varchar2(20),
       job varchar2(20),
       deptno number(20)-- ,콤마 없다 주의하기!!
);

alter table emp10--제약 조건이 생성
add  constraint emp10_empno_pk primary key(empno);

alter table emp10--제약 조건이 생성
add  constraint emp10_empno_fk foreign key(deptno) references dept(deptno);

--not null은 변경해주는 개념=>modify를 사용(null-> not null)

--modify
alter table emp10--제약 조건이 생성
modify job constraint emp10_job_nn not null;

alter table emp10--제약 조건이 생성
modify ename constraint emp10_ename_nn not null;

--drop : 제약조건명(constraint) 또는 제약조건(primary key)을 사용한다.
alter table emp10--제약조건 삭제
drop constraint emp10_empno_pk;--or drop  primary key(empno);

create table emp11(--자식     부모꺼먼전 실행후 자식꺼 실행
       empno number(4),
       ename varchar2(20),
       job varchar2(20),
       deptno number(20)-- ,콤마 없다 주의하기!!
);

alter table emp11--제약 조건이 생성
add  constraint emp11_empno_pk primary key(empno);

alter table emp11--제약 조건이 생성
add  constraint emp11_deptno_fk foreign key(deptno) references dept11(deptno);

create table dept11(--부모
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

delete from dept11--처음엔 부모를 삭제할 수 없다   단) cascads를 사용하면 삭제 가능
where deptno = 10;--오류가 난다 '자식 레코드가 발견되었습니다'

alter table dept11--이 코드를 실행하면 부모를 삭제할 수 있다
disable primary key cascade;

alter table dept11--이 코드를 실행하면 부모를 삭제할 수 있다
drop primary key cascade;


--14-1문제,ALTER tabel 명령어로 제약조건을 설정하세요
create table DEPT_CONST(--부모테이블
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

--14-2문제 
create table emp_const( --자식테이블
       empno number(4),
       ename varchar2(10),
       job varchar2(9),
       tel varchar2(20),
       hiredate date,
       sal number(7),
       comm number(7),
       deptno number(2) -- ,콤마 없다 주의하기!!
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

-------------------------뷰(view)-----------------------
--p.338

--팁--
--이름	            조작	           SQL
--Create	        생성	           INSERT
--Read             읽기(또는 인출)   SELECT
--(=Retrieve)  	
--Update 	        갱신            UPDATE
--Delete           삭제(또는 파괴)   DELETE
--(=Destroy)	

--객체 : create로 만들어지는거  ex)table, index,view
--create or replace view + 뷰테이블명[alias]  [ ]:선택사항 필수아님
--as
--서브쿼리(select=중첩되는부분)
--[with check option]
--[with read only]

create table dept_copy
as
select*
from dept;

create table emp_copy--복사되는 테이블은 제약조건이 안 넘어온다.
as
select*
from emp;

alter table emp_copy--제약조건 생성
add CONSTRAINT emp_copy_deptno_fk foreign key(deptno)references dept(deptno);

select * from emp;  --14개
select * from emp_copy;--14개

create or replace view emp_view30--system 테이블로 권한을 먼저 허용해줘야 한다.시스템 테이블에 grant create view--view30 to scott 작성한다.
as
select empno,ename,sal,deptno 
from emp_copy
where deptno = 30;

select*
from emp_view30;

insert into emp_view30--원본테이블에 들어가 있다
values (1111,'hong',1000,30);

select*--원본테이블
from emp_copy;

insert into emp_view30(empno,ename,sal)--원본테이블에 들어가 있다
values (2222,'hong',2000);

select*
from emp_view30;

select*
from emp_copy;

insert into emp_view30(empno,ename,sal,deptno)
values (2222,'hong',2000,50);

create or replace view emp_view(사원번호,사원명,급여,부서번호)
as
select empno,ename,sal,deptno
from emp_copy;

select*
from emp_view
where 부서번호=20;--emp_view(사원번호,사원명,급여,부서번호)별칭으로 했기떄문에 한글로 한다.

create or replace view emp_dept_view
as
select empno,ename,sal,e.deptno,dname,loc
from emp e inner join dept d
on e.deptno = d.deptno
order by empno desc;

select*
from emp_dept_view;--empnp가 내림차순

---------------------------------------------------10.25-------------------
--5일차에 배운 뷰와 연결

--부서별 최소급여와 최대급여,dname min_sal max_sal
create or replace view sal_view --모든객체의 이름은 중복될 수 없지만 or replace 때문에 select에 열에'avg(sal)'을 추가해서 다시 테이블생성 가능하다.
as
select dname, min(sal) as min_sal, max(sal) as max_sal,avg(sal) as avg_sal
from emp e inner join dept d 
on e.deptno = d.deptno
group by d.dname;--부서별

select*
from sal_view;

drop view sal_view;

--with check option
create or replace view view_chk30
as
select empno,ename,sal,comm,deptno
from emp_copy
where deptno = 30 with check option;--조건절의 컬럼을 수정하지 못하게한다.

update view_chk30
set deptno = 10;--with check option;--조건절의 컬럼을 수정하지 못하게한다.

--with read only
create or replace view view_read30
as
select empno,ename,sal,comm,deptno
from emp_copy
where deptno = 30 with read only;--모든 컬럼에 대한 crud중 c,u,d가 불가능(조회만 가능하다) read만 가능하다

update view_read30
set deptno = 10;--읽기 전용 뷰에서는 DML 작업을 수행할 수 없습니다=>with read only;이거 때문에

--뷰의 활용
--TOP - N 조회하기
--Rownum(의사컬럼) 
select * 
from emp;

--입사일이 가장 빠른 5명의 사원을 조회
select *--먼저 조회
from emp
order by hiredate asc;
--1번째 방법
select *
from emp
where hiredate <='81/05/01'; 

--2번째 방법 
select rownum,empno,ename,hiredate
from emp
where rownum <=5;

--order by를 이용핸 순서대로 뷰 테이블생성
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

--2번째~5번째 조회해보기
select rownum,empno,ename,hiredate
from view_hiredate
where rownum between 2 and 5;--rownum은 조건절에 사용시 반드시 1를 포함하는 식으로 만들어야 한다.

create or replace view view_hiredate_rm
as
select rownum rm,empno,ename,hiredate  --rm를 추가해 별칭으로 하면 1를 포함하는 식으로 만들수 있다.
from view_hiredate;

--2번째~5번째 조회해보기
select rm,empno,ename,hiredate
from view_hiredate_rm
where rm >1 and rm <=5;--(=where rm between 1 and 5)

----2번째~5번째를 
--인라인뷰로 표현방법
select rm,b.*--(=empno,ename,hiredate)
from(select rownum rm,a.*--(=empno,ename,hiredate)  
     from(select empno,ename,hiredate 
          from emp
          order by hiredate asc
          )a
     )b
    where rm > 1 and rm<=5;


--입사일이 가장 빠른 5명을 조회 인라인뷰로
select empno,ename,hiredate  
from(select empno,ename,hiredate 
     from emp
     order by hiredate asc
     )    
where rownum <=5; 

----------------------------------시퀀스
--자동으로 번호를 증가시키는 기능수행
--create-생성,drop-삭제
--nextval,currval

--create sequence 시퀀스명
--start with    시작값 =>1이 기본값
--increment by  증가값 =>1이 기본값
--maxvalue      최대값 =>10의 1027
--minvalue      최소값 =>10의 -1027

create sequence dept_deptno_seq
increment by 10
start with 10;

select dept_deptno_seq .nextval--실행 할 때 마다 증가
from dual;

select dept_deptno_seq .currval--현재 값 확인
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
values (emp_seq.nextval,'hong',sysdate);--실행 할 때 마다 증가
