function deepcopy(a)local b=type(a)local c;if b==TBL then c={}for d,e in next,a,nil do c[deepcopy(d)]=deepcopy(e)end;setmetatable(c,deepcopy(getmetatable(a)))else c=a end;return c end