\i setup.sql

SELECT plan(5);

SELECT has_function('pgr_bipartite');

SELECT has_function('pgr_bipartite', ARRAY['text']);
SELECT function_returns('pgr_bipartite', ARRAY['text'],  'setof record');

-- pgr_bipartite
-- parameter names
SELECT bag_has(
    $$SELECT  proargnames from pg_proc where proname = 'pgr_bipartite'$$,
    $$SELECT  '{"","node","color"}'::TEXT[] $$
);

-- parameter types
SELECT set_eq(
    $$SELECT  proallargtypes from pg_proc where proname = 'pgr_bipartite'$$,
    $$VALUES
        ('{25,20,20}'::OID[])
    $$
);

SELECT * FROM finish();
ROLLBACK;