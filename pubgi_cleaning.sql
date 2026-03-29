# trimming space of values

update pubgi
set id=trim(lower(id)),
    groupid=trim(groupid),
    matchid=trim(matchid),
    kills=trim(kills),
    damageDealt=trim(damageDealt),
    walkDistance=trim(walkDistance),
    ridedistance=trim(ridedistance),
    weaponsacquired=trim(weaponsAcquired),
    heals=trim(heals),
    boosts=trim(boosts),
    winplaceperc=trim(winPlacePerc);
    
# finding row where any value is null;

select * from pubgi
where id is null or id=''
      or groupid is null or groupid=''
      or matchid is null or matchid=''
      or kills is null or kills=''
      or damageDealt is null or damageDealt='';

# finding person that has walked max;

select * from pubgi
where walkdistance=(select max(walkDistance) from pubgi)

# finding person that has killed most person;

select * from pubgi
where kills=(select max(kills) from pubgi)  

# finding total number of boosts used by all players

select sum(boosts) as total_boost
from pubgi;

#arranging table according to kills in ascending order;

select * from pubgi
order by kills asc;

# finding average damage per person;

select avg(damageDealt) as avg_damage
from pubgi

# fingind top 10 killers;

select * from pubgi
order by kills desc
limit 10;

# selecting row by specific groupid

select * from pubgi
where groupId=26

# adding total kills by groupId 26;

select sum(kills) from pubgi
where groupId=26;

# find group that has killed most players

select groupId,sum(kills) as total_kills from pubgi 
group by groupId
order by total_kills desc
limit 1;

# finding group with maximum win percentage;

select groupId,avg(winPlaceperc) as win_percentage from pubgi
group by groupId
order by win_percentage desc
limit 1;

# selecting best player of each group;

select groupId,max(kills) from pubgi 
group by groupId
order by groupId asc;

# selecting best efficiency of players

select groupId,
	   Id,
       kills/damageDealt as efficiency from pubgi
       order by efficiency desc
       limit 10;
       
commit       