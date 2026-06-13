DELETE FROM public.ordem_bancaria_orcamentaria obo 
WHERE NOT EXISTS (    SELECT 1 FROM public.empenhos e    
WHERE e.codigo = obo.codigone AND e.codigoug = obo.codigoug );

DELETE FROM public.empenhos e 
WHERE NOT EXISTS (    SELECT 1 FROM public.unidade_gestora ug    
WHERE ug.codigo = e.codigoug AND ug.ano = e.ano );

ALTER TABLE public.unidade_gestora    
ADD CONSTRAINT ug_pkey    
PRIMARY KEY (codigo, ano);

ALTER TABLE public.empenhos    
ADD CONSTRAINT empenhos_pkey    
PRIMARY KEY (codigo, codigoug);

ALTER TABLE public.ordem_bancaria_orcamentaria    
ADD CONSTRAINT obo_pkey    
PRIMARY KEY (codigo, codigoug);

ALTER TABLE public.ordem_bancaria_orcamentaria    
ADD CONSTRAINT fk_obo_empenho    
FOREIGN KEY (codigone, codigoug)    
REFERENCES public.empenhos (codigo, codigoug);

ALTER TABLE public.empenhos    
ADD CONSTRAINT fk_empenhos_ug    
FOREIGN KEY (codigoug, ano)    
REFERENCES public.unidade_gestora (codigo, ano);

