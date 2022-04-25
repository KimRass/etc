SELECT *
FROM DATAMART_DHDT_TOTAL DDT;
--- ������Ʈ: �Ŵ� 20�� 4��?
--- ��� ����: ī�� ��ǥ ��ü, ī�� ��ǥ-`��������� ����` ��ü, `���� ����`, `���� ����������`, `���� ��������`, `���� ����������`, `���� ����`, `��� ���� ����`-(`�����`, `��������`), `�ֿ� �ι��� ����`, `�ֿ� �ι��� ����������`, `���Ͱ�꼭`, `�繫����ǥ`, `��ä����`, `���Ա�������`, `��������`, `���ں������`

-- ����: LEFT(cd_trial, 2) = '41'
-- �������: LEFT(cd_trial, 2) = '46'
-- �ǰ���: LEFT(cd_trial, 2) = '61'
-- ��������: ���� - ������� - �ǰ���
-- ��������: ���� - �������
-- ��ä: LEFT(cd_trial, 1) = '2'
-- �ڻ�: LEFT(cd_trial, 1) = '1'
-- �ں�: �ڻ� - ��ä
-- ��ä����: ��ä/�ں�
-- ���Ա�: cd_trial IN('22101101', '22201101', '22101102', '22201201', '22301101', '22301201', '27101101', '27101102', '27101104', '27101201', '27301101', '27301201', '22101100', '22201100', '27101100')
-- ���Ա�������: ���Ա�/�ڻ�
-- �����ڻ�: LEFT(cd_trial, 2) IN('11', '12', '14')
-- ������ä: LEFT(cd_trial, 2) IN('21', '22', '23')
-- ��������: �����ڻ�/������ä
-- ���ں��: LEFT(cd_trial, 6) = '716011'
-- ���ں������: ��������/���ں��
-- �����ܼ���: (71103101 <= CAST(cd_trial AS INT) AND CAST(cd_trial AS INT) <= 71109901)
-- �����ܺ��: (71603101 <= CAST(cd_trial AS INT) AND CAST(cd_trial AS INT) <= 71609901)
-- ��������: (71101100 <= CAST(cd_trial AS INT) AND CAST(cd_trial AS INT) <= 71102201)
-- �������: (71601100 <= CAST(cd_trial AS INT) AND CAST(cd_trial AS INT) <= 71602201)
-- ��Ÿ�����ܼ���: (71907008 <= CAST(cd_trial AS INT) AND CAST(cd_trial AS INT) <= 71907609)
-- ��������: �������� + �����ܼ��� - �����ܺ�� + �������� - ������� + ��Ÿ�����ܼ���

--## �� ���� �� ���� ���� ��
SELECT A.ym_magam, ����, �������, �ǰ���, ���� - ������� - �ǰ��� AS ��������, ���� - ������� AS ��������, ��ä, �ڻ�, �ڻ� - ��ä AS �ں�, ��ä/(�ڻ� - ��ä) AS ��ä����, ���Ա�, ���Ա�/�ڻ� AS ���Ա�������, �����ڻ�, ������ä, �����ڻ�/������ä AS ��������, ���ں��, (���� - ������� - �ǰ���)/���ں�� AS ���ں������, �����ܼ���, ��������, �������, ��Ÿ�����ܼ���, ���� - ������� - �ǰ��� + �����ܼ��� - �����ܺ�� + �������� - ������� + ��Ÿ�����ܼ��� AS ��������
FROM (
	(SELECT ym_magam, SUM(am_account) AS ����
	FROM DATAMART_DHDT_TOTAL DDT
	WHERE cd_dept_acnt = 'HD00'
		AND LEFT(cd_trial, 2) = '41'
	GROUP BY ym_magam) A FULL OUTER JOIN (
		SELECT ym_magam, SUM(am_account) AS �������
		FROM DATAMART_DHDT_TOTAL DDT
		WHERE cd_dept_acnt = 'HD00'
			AND LEFT(cd_trial, 2) = '46'
		GROUP BY ym_magam) B
	ON A.ym_magam = B.ym_magam FULL OUTER JOIN (
		SELECT ym_magam, SUM(am_account) AS �ǰ���
		FROM DATAMART_DHDT_TOTAL DDT
		WHERE cd_dept_acnt = 'HD00'
			AND LEFT(cd_trial, 2) = '61'
		GROUP BY ym_magam) C
	ON A.ym_magam = C.ym_magam FULL OUTER JOIN (
		SELECT ym_magam, SUM(am_account) AS ��ä
		FROM DATAMART_DHDT_TOTAL DDT
		WHERE cd_dept_acnt = 'HD00'
			AND LEFT(cd_trial, 1) = '2'
		GROUP BY ym_magam) D
	ON A.ym_magam = D.ym_magam FULL OUTER JOIN (
		SELECT ym_magam, SUM(am_account) AS �ڻ�
		FROM DATAMART_DHDT_TOTAL DDT
		WHERE cd_dept_acnt = 'HD00'
			AND LEFT(cd_trial, 1) = '1'
		GROUP BY ym_magam) E
	ON A.ym_magam = E.ym_magam FULL OUTER JOIN (
		SELECT ym_magam, SUM(am_account) AS ���Ա�
		FROM DATAMART_DHDT_TOTAL DDT
		WHERE cd_dept_acnt = 'HD00'
			AND cd_trial IN('22101101', '22201101', '22101102', '22201201', '22301101', '22301201', '27101101', '27101102', '27101104', '27101201', '27301101', '27301201', '22101100', '22201100', '27101100')
		GROUP BY ym_magam) F
	ON A.ym_magam = F.ym_magam FULL OUTER JOIN (
		SELECT ym_magam, SUM(am_account) AS �����ڻ�
		FROM DATAMART_DHDT_TOTAL DDT
		WHERE cd_dept_acnt = 'HD00'
			AND LEFT(cd_trial, 2) IN('11', '12', '14')
		GROUP BY ym_magam) G
	ON A.ym_magam = G.ym_magam FULL OUTER JOIN (
		SELECT ym_magam, SUM(am_account) AS ������ä
		FROM DATAMART_DHDT_TOTAL DDT
		WHERE cd_dept_acnt = 'HD00'
			AND LEFT(cd_trial, 2) IN('21', '22', '23')
		GROUP BY ym_magam) H
	ON A.ym_magam = H.ym_magam FULL OUTER JOIN (
		SELECT ym_magam, SUM(am_account) AS ���ں��
		FROM DATAMART_DHDT_TOTAL DDT
		WHERE cd_dept_acnt = 'HD00'
			AND LEFT(cd_trial, 6) = '716011'
		GROUP BY ym_magam) I
	ON A.ym_magam = I.ym_magam FULL OUTER JOIN (
		SELECT ym_magam, SUM(am_account) AS �����ܼ���
		FROM DATAMART_DHDT_TOTAL DDT
		WHERE cd_dept_acnt = 'HD00'
			AND (71103101 <= CAST(cd_trial AS INT) AND CAST(cd_trial AS INT) <= 71109901)
		GROUP BY ym_magam) J
	ON A.ym_magam = J.ym_magam FULL OUTER JOIN (
		SELECT ym_magam, SUM(am_account) AS �����ܺ��
		FROM DATAMART_DHDT_TOTAL DDT
		WHERE cd_dept_acnt = 'HD00'
			AND (71603101 <= CAST(cd_trial AS INT) AND CAST(cd_trial AS INT) <= 71609901)
		GROUP BY ym_magam) K
	ON A.ym_magam = K.ym_magam FULL OUTER JOIN (
		SELECT ym_magam, SUM(am_account) AS ��������
		FROM DATAMART_DHDT_TOTAL DDT
		WHERE cd_dept_acnt = 'HD00'
			AND (71101100 <= CAST(cd_trial AS INT) AND CAST(cd_trial AS INT) <= 71102201)
		GROUP BY ym_magam) L
	ON A.ym_magam = L.ym_magam FULL OUTER JOIN (
		SELECT ym_magam, SUM(am_account) AS �������
		FROM DATAMART_DHDT_TOTAL DDT
		WHERE cd_dept_acnt = 'HD00'
			AND (71601100 <= CAST(cd_trial AS INT) AND CAST(cd_trial AS INT) <= 71602201)
		GROUP BY ym_magam) M
	ON A.ym_magam = M.ym_magam FULL OUTER JOIN (
		SELECT ym_magam, SUM(am_account) AS ��Ÿ�����ܼ���
		FROM DATAMART_DHDT_TOTAL DDT
		WHERE cd_dept_acnt = 'HD00'
			AND (71907008 <= CAST(cd_trial AS INT) AND CAST(cd_trial AS INT) <= 71907609)
		GROUP BY ym_magam) N
	ON A.ym_magam = N.ym_magam
)
ORDER BY A.ym_magam;

SELECT *
FROM DATAMART_DHDT_ACNT_GROUP DDAG;
--- ������Ʈ: �Ŵ� 20�� 4��?
--- ��� ����:  ī�� ��ǥ-`��������� ����` ��ü, `�ֿ� �ι��� ����`, `�ֿ� �ι��� ����������`

SELECT *
FROM DATAMART_DHDT_TOTAL_GROUP DDTG;
--- ������Ʈ: �Ŵ� 20�� 4��?
--- ��� ����: `�ֿ� �ι��� ����`, `�ֿ� �ι��� ����������`

SELECT *
FROM DATAMART_DIFV_PL DDP;
--- ������Ʈ: �Ŵ� 20�� 4��?
--- ��� ����: `��� ���� ����`-(`����� ��ȹ`, `�������� ��ȹ`)

--## ���� ���� ���� ����� ��ȹ
SELECT MONTH, ROUND(SUM(pl) OVER(ORDER BY CAST(MONTH AS INT) ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)/100000000, 0)
FROM (
	SELECT MONTH, SUM(am_plan) AS pl
	FROM DATAMART_DIFV_PL DDP
	WHERE ds_item = '�����' AND YEAR = 2021
	GROUP BY MONTH) AS A
ORDER BY CAST(MONTH AS INT);

--## ���� ���� ���� �������� ��ȹ
SELECT MONTH, ROUND(SUM(pl) OVER(ORDER BY CAST(MONTH AS INT) ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)/100000000, 0)
FROM (
	SELECT MONTH, SUM(am_plan) AS pl
	FROM DATAMART_DIFV_PL DDP
	WHERE ds_item = '��������' AND YEAR = 2021
	GROUP BY MONTH) AS A
ORDER BY CAST(MONTH AS INT);

--## ����, �ι��� ����
SELECT DDTG.ds_group, DDT.ym_magam, SUM(am_account)
FROM DATAMART_DHDT_TOTAL DDT, DATAMART_DHDT_ACNT_GROUP DDAG, DATAMART_DHDT_TOTAL_GROUP DDTG 
WHERE DDT.cd_corp = DDAG.cd_corp
	AND DDT.cd_dept_acnt = DDAG.cd_dept_acnt
	AND DDAG.cd_group = DDTG.cd_group
	AND LEFT(cd_trial, 2) = '41'
	AND DDTG.ds_group NOT IN('��Ÿ')
	AND RIGHT(ym_magam, 2) = 12
GROUP BY DDTG.ds_group, DDT.ym_magam
ORDER BY DDTG.ds_group, DDT.ym_magam