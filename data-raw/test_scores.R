# create test_scores ----------------------------------------------------------
#
# Create 'test_scores' for teaching z-transformations
#
# -----------------------------------------------------------------------------

test_scores <- tibble::tribble(
~'id', ~'group', ~'score', ~'important',
's10', 'Class_A', 94,     'no',
's09', 'Class_A', 95,     'no',
's08', 'Class_A', 84,     'no',
's07', 'Class_A', 90,     'no',
'Friend', 'Class_A', 89,  'yes',
's05', 'Class_A', 98,     'no',
's04', 'Class_A', 92,     'no',
's03', 'Class_A', 78,     'no',
's02', 'Class_A', 81,     'no',
's01', 'Class_A', 86,     'no',
's20', 'Class_B', 73,     'no',
's19', 'Class_B', 86,     'no',
's18', 'Class_B', 64,     'no',
's17', 'Class_B', 60,     'no',
'You', 'Class_B', 89,     'yes',
's15', 'Class_B', 69,     'no',
's14', 'Class_B', 82,     'no',
's13', 'Class_B', 65,     'no',
's12', 'Class_B', 71,     'no',
's11', 'Class_B', 76,     'no')

usethis::use_data(test_scores, overwrite = TRUE)

