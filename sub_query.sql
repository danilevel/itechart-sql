use Company;

select		emp.[name], emp.[birth_date]
from		Employee as emp
where		emp.[birth_date] = (select		min(emp.[birth_date])
							    from		Employee as emp)


select		emp.[surname]
from		Employee as emp, Salary as sal
where		sal.[id_employee] = emp.[id] and
			sal.[month] = 1 and
			sal.[year] = 2015



select		emp.[id]
from		Employee as emp, Salary as sal
where		sal.[id_employee] = emp.[id] and
			sal.[month] = 5 and
			sal.[year] = 2015 and
			sal.salary < (select		max(subSal.[salary])
						  from			Employee as subEmp, Salary as subSal
						  where			subSal.[id_employee] = subEmp.[id] and
										subEmp.[id] = emp.[id] and
										subSal.[year] = 2015 and
										subSal.[month] < 5)



select		dep.[id], dep.[name],
			(select		count(subCareer.[id_employee])
			 from		Career as subCareer, Department as subDep
			 where		subCareer.[end_date] is null and
						subCareer.[id_department] = subDep.[id] and
						subDep.[id] = dep.[id])
						as employeesCount
from		Department as dep