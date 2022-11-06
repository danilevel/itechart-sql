use Company;

delete from Department;
delete from Employee;
delete from Job;
delete from Career;
delete from Salary;

dbcc checkident ('[Department]', RESEED, 0);
dbcc checkident ('[Employee]', RESEED, 0);
dbcc checkident ('[Job]', RESEED, 0);
dbcc checkident ('[Career]', RESEED, 0);
dbcc checkident ('[Salary]', RESEED, 0);

insert Department
values
('Back-end', 'M1'),
('HR', 'M1'),
('Front-end', 'M1'),
('Tester', 'M1')

insert Employee
values
('Danil', 'Chernyshov', '2002-09-10'),
('Ksenia', 'Lashchynouskaya', '2000-01-01'),
('Sergey', 'Kavaliou', '2000-01-01'),
('Andrey', 'Kisel', '2001-10-18'),
('Nikita', 'Kyzmenok', '2002-03-07'),
('Denis', 'leonenko', '2002-06-30'),
('Maksim', 'Rozkov', '2002-07-01'),
('Alina', 'Navoeva', '2002-04-28')

insert Job
values
('.NET', 500.00),
('.Java', 450.00),
('Recruiter', 300.00),
('React developer', 600.00),
('Manual tester', 300)

insert Career
values
('2020-08-08', null, 1, 1, 1),
('2017-08-23', null, 2, 1, 1),
('2015-04-01', null, 3, 1, 1),
('2020-03-21', null, 4, 1, 1),
('2020-08-08', null, 5, 2, 1),
('2020-08-08','2022-08-08', 6, 1, 1),
('2020-08-08', null, 7, 4, 3),
('2020-08-08', null, 8, 3, 2)

insert Salary
values
(1, 1, 2015, 500.00),
(1, 2, 2015, 600.00),
(2, 4, 2013, 2800.00),
(2, 3, 2015, 2900.00),
(3, 1, 2015, 3500.00),
(3, 2, 2015, 3800.00),
(4, 8, 2010, 1000.00),
(4, 9, 2015, 1100.00),
(5, 1, 2015, 600.00),
(5, 5, 2015, 500.00),
(5, 4, 2015, 450.00),
(6, 1, 2012, 800.00),
(6, 2, 2015, 900.00),
(7, 1, 2015, 900.00),
(7, 2, 2015, 1000.00),
(8, 3, 2010, 600.00),
(8, 4, 2015, 700.00)