SELECT *
FROM ������̼���Ȳ�Ѱ�ǥ_�۾�;

SELECT *
FROM ����Ϻ�_�۾�;

--## �Ϻ� ��� ��
SELECT �ڵ�, �����, �о籸��, �о�����, �������, COUNT(�������) AS cnt
FROM ����Ϻ�_�۾�
WHERE 1=1
	AND CAST(������� AS DATE) > '2020-12-31'
	AND CAST(������� AS DATE) < '2021-10-01'
	AND �ڵ� IN('C032')
GROUP BY �ڵ�, �����, �о籸��, �о�����, �������
ORDER BY �������

--## �Ϻ� �ؾ� ��
SELECT �ڵ�, �����, �о籸��, �о�����, �������, COUNT(�ؾ�����) AS cnt
FROM ����Ϻ�_�۾�
WHERE 1=1
	AND CAST(�ؾ����� AS DATE) > '2020-12-31'
	AND CAST(�ؾ����� AS DATE) < '2021-10-01'
	AND �ڵ� IN('C032')
GROUP BY �ڵ�, �����, �о籸��, �о�����, �������
ORDER BY �������