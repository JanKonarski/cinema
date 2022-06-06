USE cinema;

/* User table */
INSERT INTO user (id, name, password, role, registered) VALUES
(
    '4da72010-e5f5-4248-81fe-1dbb17b08dc5'
,   'admin'
,   '$argon2id$v=19$m=65536,t=4,p=1$aDJ0TWN4NkFkRHU2dHpEWQ$B2Z7f9NAJ/5ugilifaAyzAm87zSHAWGKBCv+nT0a434'     /* abc123DEF$%^ */
,   'admin'
,   true
),
(
    'ff000a5e-4904-44d9-80ae-151a8bec31fe'
,   'user1'
,   '$argon2id$v=19$m=65536,t=4,p=1$ZjZucGE1NmJ0YVJrZ252dg$xg3CACzjC7PaRG20gMXPBZg2lYG+PGVs23peGqMGFzI'     /* !@#abc4567DEF */
,   'client'
,   true
),
(
    '90cc4c68-ce33-485d-9a9c-b2f93ed6cc6a'
,   'user2'
,   '$argon2id$v=19$m=65536,t=4,p=1$Ly9idHRkTG41T09QRUQ0Rw$HDq/Aq03HUh4CFsqYCn9cYo+PegjYH7m0kOkAge36yU'     /* 123ABC$%^def */
,   'client'
,   true
);
/*--------------------------------------------------------------------------------------------------------------------*/
/*  */

/*--------------------------------------------------------------------------------------------------------------------*/
/* Movie table */
INSERT INTO movie (id, name, category, description) VALUES
(
    'dce4db4b-8097-4728-8c2a-b6d03a7c943b'
,   'Top Gun: Maverick'
,   'action'
,   'After more than thirty years of service as one of the Navy''s top aviators, Pete Mitchell is where he belongs, pushing the envelope as a courageous test pilot and dodging the advancement in rank that would ground him.'
),
(
    '8693f211-d17f-4220-80d7-fe35321cf72a'
,   'Brian and Charles'
,   'comedy'
,   'After a particularly harsh winter Brian goes into a deep depression; completely isolated and with no one to talk to, Brian does what any sane person would do when faced with such a melancholic situation. He builds a robot.'
),
(
    '99cc2933-0047-406c-b459-e0769650085a'
,   'Chip ''n Dale: Rescue Rangers'
,   'animation'
,   'Thirty years after their popular television show ended, chipmunks Chip and Dale live very different lives. When a cast member from the original series mysteriously disappears, the pair must reunite to save their friend.'
),
(
    '9c9bde32-ce7d-494c-8595-c9d6766d67e3'
,   'Stranger Things'
,   'drama'
,   'When a young boy disappears, his mother, a police chief and his friends must confront terrifying supernatural forces in order to get him back.'
),
(
    '36a0ab4a-6512-4ac7-8d43-1afc50c62073'
,   'The Lincoln Lawyer'
,   'crime'
,   'An iconoclastic idealist runs his law practice out of the back of his Lincoln Town Car in this series based on Michael Connelly''s bestselling novels.'
);
/*--------------------------------------------------------------------------------------------------------------------*/
/* Seance */
INSERT INTO seance (id, movieID, seanceDate, startTime, endTime, roomNumber) VALUES
(
    'c68a104e-5514-445b-b600-5b69640d8290'
,   'dce4db4b-8097-4728-8c2a-b6d03a7c943b'
,   '2023-06-07'
,   '08:00:00'
,   '10:00:00'
,   1
),
(
    'a60265f2-9ae3-4725-b44f-c8a274d3b967'
,   'dce4db4b-8097-4728-8c2a-b6d03a7c943b'
,   '2023-06-07'
,   '11:00:00'
,   '13:00:00'
,   3
),
(
    'a2b949ef-9860-4789-b206-5f383ac42ddc'
,   'dce4db4b-8097-4728-8c2a-b6d03a7c943b'
,   '2023-06-07'
,   '14:00:00'
,   '16:00:00'
,   1
),
(
    'ea53b2b7-0451-4cb3-b0e8-363e78238137'
,   'dce4db4b-8097-4728-8c2a-b6d03a7c943b'
,   '2023-06-07'
,   '17:00:00'
,   '19:00:00'
,   2
),
(
    'c7632cf4-1758-4261-9ab2-ebaa44744aed'
,   '8693f211-d17f-4220-80d7-fe35321cf72a'
,   '2023-06-07'
,   '08:00:00'
,   '10:00:00'
,   2
),
(
    'd2e45c0e-908d-4e0d-a71c-a638b23efdb1'
,   '8693f211-d17f-4220-80d7-fe35321cf72a'
,   '2023-06-07'
,   '11:00:00'
,   '13:00:00'
,   1
),
(
    '01368a4b-514c-458d-b0d9-1094bf3bf7a2'
,   '8693f211-d17f-4220-80d7-fe35321cf72a'
,   '2023-06-07'
,   '14:00:00'
,   '16:00:00'
,   3
),