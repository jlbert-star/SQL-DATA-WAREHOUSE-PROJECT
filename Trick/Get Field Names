begin
declare @f varchar(4000)

set @f = ' '
select @f = @f + c.name + ','
from syscolumns c, sysobjects o
where c.id = o.id
and o.name = 'crm_prd_info'
order by colorder

select @f
end
go
