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
/* transaction */
INSERT INTO transaction (id, timestamp, confirmed, cardNumber, price) VALUES
(
    'a10aa881-719e-40b3-ab10-9164e30fa011'
,   '2022-04-15 12:14:00'
,   true
,   '0000000000000000'
,   0.00
),
(
    'a5ecab67-d6e6-4724-a4a3-8507c2af0cc8'
,   '2022-10-20 19:07:00'
,   true
,   '0000000000000000'
,   0.00
),
(
    '2f03d3bf-5fc8-428a-b939-35c0a529b9ab'
,   '2022-12-04 07:14:00'
,   true
,   '0000000000000000'
,   0.00
),
(
    '482b2b0d-1057-41e6-94ee-94f58bb4fcff'
,   '2022-07-19 13:01:00'
,   true
,   '0000000000000000'
,   0.00
),
(
    '69c040a2-7d46-4602-b0ba-3e2ebe83568a'
,   '2022-05-11 15:51:00'
,   true
,   '0000000000000000'
,   0.00
),
(
    '77686746-07cd-47ae-83c3-7b0680c54716'
,   '2022-01-01 11:09:00'
,   true
,   '0000000000000000'
,   0.00
),
(
    'eb846250-ef07-4f4e-9d45-59eebf5c5e6c'
,   '2022-03-24 23:34:00'
,   true
,   '0000000000000000'
,   0.00
);
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
/* 2023-06-07 */
/* Top Gun: Maverick */
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
/* Brian and Charles */
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
/* Chip 'n Dale: Rescue Rangers */
(
    '77b3fbed-5948-40b2-b1f4-0d227b832466'
,   '99cc2933-0047-406c-b459-e0769650085a'
,   '2023-06-07'
,   '08:00:00'
,   '10:00:00'
,   3
),
(
    '2bd99d34-0948-4e2c-a3d0-11168847621d'
,   '99cc2933-0047-406c-b459-e0769650085a'
,   '2023-06-07'
,   '11:00:00'
,   '13:00:00'
,   2
),
(
    'b379c71f-d99c-4011-8dec-1da2a26ee246'
,   '99cc2933-0047-406c-b459-e0769650085a'
,   '2023-06-07'
,   '14:00:00'
,   '16:00:00'
,   2
),
(
    'd7b0bd38-c387-4b56-b87f-2acdef3d83f4'
,   '99cc2933-0047-406c-b459-e0769650085a'
,   '2023-06-07'
,   '17:00:00'
,   '19:00:00'
,   1
),
/* Stranger Things */
(
    '0c42d277-7672-467a-9cdd-893547ccd3c5'
,   '9c9bde32-ce7d-494c-8595-c9d6766d67e3'
,   '2023-06-07'
,   '08:00:00'
,   '10:00:00'
,   4
),
(
    '96aca0a4-d5ed-4b34-a26f-dec8fb0337f9'
,   '9c9bde32-ce7d-494c-8595-c9d6766d67e3'
,   '2023-06-07'
,   '14:00:00'
,   '16:00:00'
,   4
),
(
    '9de3ca64-5c3b-464e-bc75-3f349704afaf'
,   '9c9bde32-ce7d-494c-8595-c9d6766d67e3'
,   '2023-06-07'
,   '17:00:00'
,   '19:00:00'
,   3
),
/* Stranger Things */
(
    '4c282145-929e-4d71-9240-2cf70cfa1f55'
,   '9c9bde32-ce7d-494c-8595-c9d6766d67e3'
,   '2023-06-07'
,   '11:00:00'
,   '13:00:00'
,   4
),
(
    'c41c7aae-23fe-45d9-a836-6436e42b3020'
,   '9c9bde32-ce7d-494c-8595-c9d6766d67e3'
,   '2023-06-07'
,   '14:00:00'
,   '16:00:00'
,   5
),
(
    '3a45d9fd-1858-4f1e-9369-99048938b5be'
,   '9c9bde32-ce7d-494c-8595-c9d6766d67e3'
,   '2023-06-07'
,   '17:00:00'
,   '19:00:00'
,   4
),
/* The Lincoln Lawyer */
(
    'dd9bf4a9-44dd-43a4-bf2c-879e34439de9'
,   '36a0ab4a-6512-4ac7-8d43-1afc50c62073'
,   '2023-06-07'
,   '08:00:00'
,   '10:00:00'
,   5
),
(
    'bd52d87d-500a-4a1d-972e-56e483aeb1c6'
,   '36a0ab4a-6512-4ac7-8d43-1afc50c62073'
,   '2023-06-07'
,   '07:00:00'
,   '19:00:00'
,   5
);
/*--------------------------------------------------------------------------------------------------------------------*/
/* Ticket table */
INSERT INTO ticket (id, userID, transactionID, seanceID, timestamp, seat, price) VALUES
(
    'b3a938c0-0957-45f6-b195-1dd9f93a84c7'
,   'ff000a5e-4904-44d9-80ae-151a8bec31fe'
,   '77686746-07cd-47ae-83c3-7b0680c54716'
,   '0c42d277-7672-467a-9cdd-893547ccd3c5'
,   '2022-01-01 11:10:00'
,   'r1c5'
,   20.00
);
/*--------------------------------------------------------------------------------------------------------------------*/
/* Comment table */
INSERT INTO comment (id, userID, movieID, text, rate) VALUES
(
    '11c8fb9a-ddc2-4b52-a9a4-9c5b1045d372'
,   'ff000a5e-4904-44d9-80ae-151a8bec31fe'
,   'dce4db4b-8097-4728-8c2a-b6d03a7c943b'
,   ''
,   4
),
(
    'daec19df-bb4e-4566-ade3-a58198900b49'
,   'ff000a5e-4904-44d9-80ae-151a8bec31fe'
,   '8693f211-d17f-4220-80d7-fe35321cf72a'
,   ''
,   2
),
(
    'f8bc534e-fd3f-4367-b141-b48fc0778309'
,   '90cc4c68-ce33-485d-9a9c-b2f93ed6cc6a'
,   '99cc2933-0047-406c-b459-e0769650085a'
,   ''
,   3
),
(
    '1f97ea9a-4b24-4b84-ad63-d295559204c1'
,   'ff000a5e-4904-44d9-80ae-151a8bec31fe'
,   '9c9bde32-ce7d-494c-8595-c9d6766d67e3'
,   ''
,   5
),
(
    '771c3f2c-2fbb-4406-94c5-15bfa2bcb9dc'
,   '90cc4c68-ce33-485d-9a9c-b2f93ed6cc6a'
,   '36a0ab4a-6512-4ac7-8d43-1afc50c62073'
,   ''
,   5
);
/*--------------------------------------------------------------------------------------------------------------------*/
/* Goods table */
INSERT INTO goods (id, name, price) VALUES
(
    'f557f454-2b9e-42aa-a0d5-460e3c0116c3'
,   'Popcorn'
,   2.54
),
(
    'db1b5f06-9de8-4d32-bd0c-2517d317f0d0'
,   'Coca-cola'
,   1.74
),
(
    '162669fd-560c-4b8f-8744-011f4d17ff3b'
,   'Juice'
,   1.05
),
(
    '67d828b3-f89a-4f7e-a4d3-050f9c61f70d'
,   'Nachos'
,   3.95
),
(
    'e06e24cb-0541-4143-96d2-7768febb4fab'
,   'Nuts'
,   7.17
);
/*--------------------------------------------------------------------------------------------------------------------*/
/* Purchase table */
INSERT INTO purchase (id, userID, transactionID) VALUES
(
    '81f2070f-b424-447f-9489-8704bb73701b'
,   'ff000a5e-4904-44d9-80ae-151a8bec31fe'
,   '77686746-07cd-47ae-83c3-7b0680c54716'
);
/*--------------------------------------------------------------------------------------------------------------------*/
/* Cart table */
INSERT INTO cart (purchaseID, goodID, count) VALUES
(
    '81f2070f-b424-447f-9489-8704bb73701b'
,   'f557f454-2b9e-42aa-a0d5-460e3c0116c3'
,   1
),
(
    '81f2070f-b424-447f-9489-8704bb73701b'
,   'db1b5f06-9de8-4d32-bd0c-2517d317f0d0'
),
(
    '81f2070f-b424-447f-9489-8704bb73701b'
,   'e06e24cb-0541-4143-96d2-7768febb4fab'
);