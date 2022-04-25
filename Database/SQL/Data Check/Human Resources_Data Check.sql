SELECT *
FROM DATAMART_DAAV_BASEINFO_DETAIL DDBD;
--- ������Ʈ: ���� 0�� 20��.
--- ��� ����: ī�� ��ǥ ��ü, `�ο� ��Ȳ`, `��� ����`, `������ ��Ȳ`, `��������`
--- `dt_birth`: �� 1�ڸ�: 1900���� ���� 1 ���� 2, 2000���� ���� 3 ���� 4.

SELECT *
FROM DATAMART_DAAV_BASEINFO_MONTH DDBM;
--- ������Ʈ: ���� 1��
--- ���ڵ� �߰�: �Ŵ� 1�Ͽ� ������ ���� �������� �߰�.
--- ��� ����: `���� �ΰǺ��ο� ����`, `�δ� ���꼺���ΰǺ�� ���꼺`, `ä�뱸�к� �ο�`, `�ٹ����� �ο�`, `�ӱ���ũ���������� (����)`
--- `use_month`�� ���� ū �� �������� 12���� �Ǵ� 10��ġ ǥ��.
--- `use_month`: 2011�� 3������ 2019�� 9������ 3���� �����θ� �� ����. 2019�� 10�����ʹ� 1���� ������ ����. `use_month`���� ������ ���ڵ� ����.
--- `am_incomesum_month`: �������� �ΰǺ�

--## ä�뱸��, ������ �ο� ��
SELECT use_month, ds_emptype_bi, COUNT(*)
FROM DATAMART_DAAV_BASEINFO_MONTH DDBM
WHERE ty_count = 'Y'
GROUP BY use_month, ds_emptype_bi
ORDER BY use_month, ds_emptype_bi;

SELECT *
FROM DATAMART_DAAV_BASEINFO_YEAR DDBY
ORDER BY use_month DESC;
--- ������Ʈ: ���� 1��
--- ���ڵ� �߰�: �ų� 4�� 1��, 7�� 1��, 10�� 1��, 1�� 1�Ͽ� ������ ���� �������� �߰�.
--- ��� ����: `ä�뱸�к� �ΰǺ�`, `�ٹ����� �ΰǺ�`
--- `use_month`: 2011�� ���� �ų� 3, 6, 9, 12��. `use_month`���� ���ڵ� 1��.
--- `am_regular`: ������ �ΰǺ�
--- `am_contract`: ����� �ΰǺ�

--## ������ �ΰǺ�
SELECT use_month, am_total
FROM DATAMART_DAAV_BASEINFO_YEAR DDBY
WHERE RIGHT(use_month, 2) IN('12')
ORDER BY use_month DESC;

--## ����, �ٹ����� �ΰǺ�
SELECT LEFT(use_month, 4), ds_tydept_bi, SUM(am_incomesum_month)
FROM DATAMART_DAAV_BASEINFO_MONTH DDBM
GROUP BY ds_tydept_bi, LEFT(use_month, 4)
ORDER BY LEFT(use_month, 4) DESC, ds_tydept_bi

SELECT *
FROM DATAMART_DAAV_BASEINFO_MONTH_FUTURE DDBMF;
--- ������Ʈ: ���� 1��
--- ���ڵ� �߰�: �ų� 2�� 1�Ͽ� 5�� �� 1�� 31�� �������� �߰�.
--- ��� ����: `�ӱ���ũ����������`
--- `use_month`: 2022�� ���� �ų� 1��.

--## ��������
SELECT use_month, COUNT(*) AS cnt
FROM datamart_daav_baseinfo_month
WHERE (RIGHT(use_month, 2) = 12 OR use_month = CONCAT(YEAR(GETDATE() - 1), MONTH(GETDATE() - 1) - 1)) AND ds_emptype_bi = '������' AND ds_position_bi != '�ӿ�' AND DATEDIFF(YEAR, CAST('19' + LEFT(dt_birth, 6) AS DATE), CAST(LEFT(use_month, 4) + '-' + RIGHT(use_month, 2) + '-' + '01' AS DATE)) BETWEEN 57 AND 60
GROUP BY use_month
UNION ALL
SELECT use_month, COUNT(*) AS cnt
FROM datamart_daav_baseinfo_month_future
WHERE RIGHT(use_month, 2) = '01' AND ds_emptype_bi = '������' AND ds_position_bi != '�ӿ�' AND DATEDIFF(YEAR, CAST('19' + LEFT(dt_birth, 6) AS DATE), CAST(CONCAT_WS('-', LEFT(use_month, 4), RIGHT(use_month, 2), '01') AS DATE)) BETWEEN 57 AND 60
GROUP BY use_month;

SELECT *
FROM DATAMART_DAAV_LICENSE DDL;
--- ������Ʈ: ���� 0�� 20��.
--- ��� ����: `��������`-`�ڰ���`

SELECT *
FROM DATAMART_DAAV_SCHOOLCAREER DDS;
--- ������Ʈ: ���� 0�� 20��.
--- ��� ����: `��������`-`�з�`

--## �з�
SELECT A.ds_degree, COUNT(*) 
FROM (
	SELECT DDS.id_sabun, ROW_NUMBER() OVER(PARTITION BY DDS.id_sabun ORDER BY DDS.cd_degree DESC) AS max_degree, DDS.ds_degree
	FROM DATAMART_DAAV_SCHOOLCAREER DDS LEFT OUTER JOIN DATAMART_DAAV_BASEINFO_DETAIL DDBD ON DDS.cd_corp = DDBD.cd_corp AND DDS.id_sabun = DDBD.id_sabun
	WHERE DDS.cd_degree IS NOT NULL AND DDBD.ds_retire != '����' AND DDBD.DS_EMPTYPE_BI = '������') A
WHERE A.max_degree = 1
GROUP BY A.ds_degree;

SELECT *
FROM DATAMART_DAAV_ORDER DDO;
--- ������Ʈ: ���� 0�� 20��.
--- ��� ����: `������ ����� ����`, `����� ����� ����`, `������ ����� ���� (10����)`
--- �̷� �߷��� ���ܵ�.

--## ����� ��
SELECT YEAR(dt_order), ds_emptype_bi, ds_order1, COUNT(*) AS CNT
FROM (
	SELECT *
	FROM (
		SELECT CAST(dt_order AS DATE) AS dt_order, id_sabun, ds_hname, ds_emptype_bi, ds_order1, ds_order2, ds_join_bi, ds_retire_bi
		FROM DATAMART_DAAV_ORDER DDO) A
	WHERE (ds_order1 = '�Ի�'
		OR ds_order1 = '���')
		AND dt_order > '1999-12-31'
		AND (ds_retire_bi != ''
			OR ds_join_bi != '')
) A
GROUP BY YEAR(dt_order), ds_emptype_bi, ds_order1
ORDER BY YEAR(dt_order), ds_emptype_bi, ds_order1

--## 2021�� ���� man-months
-- 2021.01.01: CAST(DATEADD(YEAR, DATEDIFF(YEAR, 0, GETDATE()), 0) AS DATE),
-- 2021.12.31: CAST(DATEADD(YEAR, DATEDIFF(YEAR, 0, GETDATE()) + 1, -1) AS DATE)
SELECT *, DATEDIFF(DAY, dt_start, dt_end) AS days
FROM (
	SELECT id_sabun, ds_hname, ds_order1, ds_dept,
		CAST(CASE WHEN dt_order >= '2021-01-01' THEN dt_order ELSE '2021-01-01' END AS DATE) AS dt_start,
		CAST(CASE WHEN dt_orderend <= '2022-01-01' THEN dt_orderend ELSE '2022-01-01' END AS DATE) AS dt_end
	FROM
		(SELECT id_sabun, ds_hname, ds_order1, ds_dept, CAST(dt_order AS DATE) AS dt_order, CAST(dt_orderend AS DATE) AS dt_orderend
		FROM DATAMART_DAAV_ORDER DDO
		WHERE cd_corp = 'A101' AND ds_tydept_bi = '����' and ds_order1 != '���' and ds_order1 != '��������' and ds_order1 != '��������') A) B
WHERE dt_start <= dt_end
ORDER BY id_sabun

SELECT id_sabun, ds_hname, ds_dept, SUM(days)
FROM (
	SELECT *, DATEDIFF(DAY, dt_start, dt_end) AS days
	FROM (
		SELECT id_sabun, ds_hname, ds_order1, ds_dept,
			CAST(CASE WHEN dt_order >= '2021-01-01' THEN dt_order ELSE '2021-01-01' END AS DATE) AS dt_start,
			CAST(CASE WHEN dt_orderend <= '2022-01-01' THEN dt_orderend ELSE '2022-01-01' END AS DATE) AS dt_end
		FROM
			(SELECT id_sabun, ds_hname, ds_order1, ds_dept, CAST(dt_order AS DATE) AS dt_order, CAST(dt_orderend AS DATE) AS dt_orderend
			FROM DATAMART_DAAV_ORDER DDO
			WHERE cd_corp = 'A101' AND ds_tydept_bi = '����' and ds_order1 != '���' and ds_order1 != '��������' and ds_order1 != '��������') A) B
	WHERE dt_start <= dt_end) C
GROUP BY id_sabun, ds_hname, ds_dept
ORDER BY id_sabun

SELECT SUM(interv)
FROM (
    SELECT DATEDIFF(DAY, dt_start, dt_end) AS interv
    FROM ( 
        SELECT
        	CAST(CASE WHEN dt_order >= '2021-01-01' THEN dt_order ELSE '2021-01-01' END AS DATE) AS dt_start,
            CAST(CASE WHEN dt_orderend <= '2021-12-31' THEN dt_orderend ELSE '2021-12-31' END AS DATE) AS dt_end
        FROM 
        	(SELECT cd_corp, ds_tydept_bi, ds_order1, CAST(dt_order AS DATE) AS dt_order, CAST(dt_orderend AS DATE) AS dt_orderend
        	FROM DATAMART_DAAV_ORDER DDO
        	WHERE cd_corp = 'A101' AND ds_tydept_bi = '����' and ds_order1 != '���' and ds_order1 != '��������' and ds_order1 != '��������') A) B) C
WHERE interv > 0

SELECT *
FROM DATAMART_DAUV_ANNUALINCOME DDA;
--- ������Ʈ: ���� 0�� 20��.
--- ��� ����: `��� ����`

SELECT *
FROM DATAMART_DAUV_ANNUALINCOME DDA
WHERE id_sabun = '6363';

--## �ٹ���, ä�뱸�к� ��� ����
SELECT DDBD.ds_tydept_bi, DDBD.ds_emptype_bi, SUM(DDA.am_salary) AS '���� ��', COUNT(DISTINCT DDBD.id_sabun) AS '�ο� ��', ROUND(SUM(DDA.am_salary)/COUNT(*)/10000, 0) AS '���'
FROM DATAMART_DAUV_ANNUALINCOME DDA LEFT OUTER JOIN DATAMART_DAAV_BASEINFO_DETAIL DDBD ON DDA.cd_corp = DDBD.cd_corp AND DDA.id_sabun = DDBD.id_sabun
WHERE DDA.cd_corp = 'A101' AND DDBD.ds_retire != '����'
GROUP BY ds_tydept_bi, ds_emptype_bi
ORDER BY ds_tydept_bi, ds_emptype_bi;

--## ����, ä�뱸�к� ��� ����
SELECT DDBD.ds_position_bi, DDBD.ds_emptype_bi, SUM(DDA.am_salary) AS '���� ��', COUNT(DISTINCT DDBD.id_sabun) AS '�ο� ��', ROUND(SUM(DDA.am_salary)/COUNT(*)/10000, 0) AS '���'
FROM DATAMART_DAUV_ANNUALINCOME DDA LEFT OUTER JOIN DATAMART_DAAV_BASEINFO_DETAIL DDBD ON DDA.cd_corp = DDBD.cd_corp AND DDA.id_sabun = DDBD.id_sabun
WHERE DDA.cd_corp = 'A101' AND DDBD.ds_retire != '����'
GROUP BY ds_position_bi, ds_emptype_bi
ORDER BY ds_position_bi, ds_emptype_bi;

--## ������ ����
SELECT *
FROM (
	SELECT DDBD.id_sabun, DDBD.ds_hname, SUM(DDA.am_salary) AS sal
	FROM DATAMART_DAUV_ANNUALINCOME DDA LEFT OUTER JOIN DATAMART_DAAV_BASEINFO_DETAIL DDBD ON DDA.cd_corp = DDBD.cd_corp AND DDA.id_sabun = DDBD.id_sabun
	WHERE DDA.cd_corp = 'A101' AND DDBD.ds_retire != '����'
	GROUP BY DDBD.id_sabun, DDBD.ds_hname) A
--WHERE ds_hname = ''
ORDER BY sal DESC;

SELECT *
FROM DATAMART_DHDT_TOTAL DDT
ORDER BY ym_magam DESC;
--- ������Ʈ: ���� �ʿ�
--- ��� ����: `�δ� ���꼺���ΰǺ�� ���꼺`

--## �����
SELECT ym_magam, CAST(ROUND(SUM(am_account)/100000000, 0) AS BIGINT)
FROM datamart_dhdt_total
WHERE cd_corp = 'A101' AND cd_dept_acnt = 'HD00' AND LEFT(cd_trial, 2) = '41' AND RIGHT(ym_magam, 2) IN('03', '06', '09', '12')
GROUP BY ym_magam
ORDER BY ym_magam;

SELECT *
FROM ������Ʈ���_���������_����_���ǹ� ��������;
--- ������Ʈ: ���� 4��.
--- ��� ����: `���� ��`
--- �������� ���� ����, �̴��� ���� �������� ���� �� ī��Ʈ