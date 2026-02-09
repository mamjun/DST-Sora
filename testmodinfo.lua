modinfo = require "./modinfo"
for k,v in pairs(configuration_options) do
    print(v.name,v.label,v.default)
    for ik,iv in ipairs(v.options or {}) do 
        print(iv.data,iv.hover,iv.description)
    end
    print("----------")
end