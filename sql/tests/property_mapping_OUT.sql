

--exec orm_property_rename 'square', 'colour', 'color'
--exec orm_property_rename 'square', 'color', 'colour'
go

select * from orm_triangle_wide
select * from orm_square_wide
select * from orm_pentagon_wide
select * from orm_sqentagon_wide

go

select	t.name as [type]
	,	o.name as [object]
	,	p.name as [property]
	,	v.value
	,	t.typeID
	,	o.objectID
	,	p.propertyID
from orm_meta_values_string as v
	inner join orm_meta_objects as o
		on v.objectID = o.objectID
	inner join orm_meta_properties as p
		on v.propertyID = p.propertyID
	inner join orm_meta_types as t
		on p.typeID = t.typeID
where p.datatypeID = 1
order by t.typeID, o.name, p.name