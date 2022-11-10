use Company

select * into #tempEmployee
from Employee

--select * from #tempEmployee

drop table if exists #tempEmployee