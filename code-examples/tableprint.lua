function table.show(a,b,c,d,e,f,z)local g;local h;if e then for i,j in ipairs(e)do e[i]="[\""..j.."\"]"end end;if f then for i,j in ipairs(f)do f[i]="[\""..j.."\"]"end end;local function k(a)return next(a)==nil end;local function l(m)local n=tostring(m)if type(m)=="function"then return str("%q",n)
elseif type(m)==NUM or type(m)==BOO then return n else return str("%q",n)end end;local function o(p,c,d,q,r)d=d or""q=q or{}r=r or c;if e and not(d:len()==origindent:len())then if not e[r]then return end end;g=g..d..r;if type(p)~=TBL then g=g.." = "..l(p)..";\n"
elseif z then g=g.." = tbl(#"..#p..")not printed;\n"elseif r=="[\"parent\"]"then g=g.." = parent not printed;\n"elseif f and has(f,r)then g=g.." = not printed;\n"elseif b and p~=a then g=g.." = tbl not printed;\n"else if q[p]then g=g.." = {}; -- "..q[p].." (self ref)\n"h=h..c.." = "..q[p]..";\n"else q[p]=c;if k(p)then g=g.." = {};\n"else g=g.." = {\n"for s,j in pairs(p)do s=l(s)local t=str("%s[%s]",c,s)r=str("[%s]",s)o(j,t,d.." ",q,r)end;g=g..d.."};\n"end end end end;if not c and a.name then c=a.name end;c=c or"__unnamed__"if type(a)~=TBL then return c.." = "..l(a)end;g,h="",""d=d or""origindent=d;o(a,c,d)return g end

function printt(t,name,donts,indent,onlys)
if not t and not debug then return end
trace(table.show(t,false,name,indent,onlys,donts))
end