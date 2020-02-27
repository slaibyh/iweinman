function [pT,pg] = planet(m,r,a)
%PLANET Takes the mass of planet, its radius, and its orbital radius and
%returns its orbital period and its g. 

if nargin ~= 3
    error("Please input planet's mass, planet's radius, and planet's orbital radius")
end

pT = a.^3;
pg = r./m;

end

