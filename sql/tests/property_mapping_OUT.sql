

--exec orm_property_rename 'square', 'colour', 'color'
--exec orm_property_rename 'square', 'color', 'colour'
go

select * from orm_triangle_wide
select * from orm_square_wide
select * from orm_pentagon_wide
select * from orm_sqentagon_wide

go

select	t.name as [template]
	,	o.name as [object]
	,	p.name as [property]
	,	v.value
	,	t.templateID
	,	o.objectID
	,	p.propertyID
from orm_meta_values_string as v
	inner join orm_meta_objects as o
		on v.objectID = o.objectID
	inner join orm_meta_properties as p
		on v.propertyID = p.propertyID
	inner join orm_meta_templates as t
		on p.templateID = t.templateID
where p.datatypeID = 1
order by t.templateID, o.name, p.name