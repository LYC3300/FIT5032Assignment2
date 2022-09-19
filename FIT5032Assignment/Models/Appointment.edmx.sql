
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/19/2022 20:13:33
-- Generated from EDMX file: D:\source\repos\FIT5032Assignment\FIT5032Assignment\Models\Appointment.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [aspnet-FIT5032Assignment-20220919075832];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_AspNetUserRolesPatient]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PatientSet] DROP CONSTRAINT [FK_AspNetUserRolesPatient];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUserRolesDoctor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DoctorSet] DROP CONSTRAINT [FK_AspNetUserRolesDoctor];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUserRolesAdministrator]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AdministratorSet] DROP CONSTRAINT [FK_AspNetUserRolesAdministrator];
GO
IF OBJECT_ID(N'[dbo].[FK_DoctorBooking]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BookingSet] DROP CONSTRAINT [FK_DoctorBooking];
GO
IF OBJECT_ID(N'[dbo].[FK_PatientBooking]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BookingSet] DROP CONSTRAINT [FK_PatientBooking];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AspNetUserRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserRoles];
GO
IF OBJECT_ID(N'[dbo].[PatientSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PatientSet];
GO
IF OBJECT_ID(N'[dbo].[DoctorSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DoctorSet];
GO
IF OBJECT_ID(N'[dbo].[BookingSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BookingSet];
GO
IF OBJECT_ID(N'[dbo].[AdministratorSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AdministratorSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'AspNetUserRoles'
CREATE TABLE [dbo].[AspNetUserRoles] (
    [UserId] nvarchar(128)  NOT NULL,
    [RoleId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'PatientSet'
CREATE TABLE [dbo].[PatientSet] (
    [Patient_Id] nvarchar(max)  NOT NULL,
    [First_Name] nvarchar(max)  NOT NULL,
    [Last_Name] nvarchar(max)  NOT NULL,
    [UserID] nvarchar(max)  NOT NULL,
    [AspNetUserRoles_UserId] nvarchar(128)  NULL,
    [AspNetUserRoles_RoleId] nvarchar(128)  NULL
);
GO

-- Creating table 'DoctorSet'
CREATE TABLE [dbo].[DoctorSet] (
    [Doctor_Id] nvarchar(max)  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [AspNetUserRoles_UserId] nvarchar(128)  NULL,
    [AspNetUserRoles_RoleId] nvarchar(128)  NULL
);
GO

-- Creating table 'BookingSet'
CREATE TABLE [dbo].[BookingSet] (
    [Booking_Id] int IDENTITY(1,1) NOT NULL,
    [DoctorDoctor_Id] nvarchar(max)  NOT NULL,
    [PatientPatient_Id] nvarchar(max)  NOT NULL,
    [AdministratorAdmin_Id] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'AdministratorSet'
CREATE TABLE [dbo].[AdministratorSet] (
    [Admin_Id] nvarchar(max)  NOT NULL,
    [Admin_Name] nvarchar(max)  NOT NULL,
    [AspNetUserRoles_UserId] nvarchar(128)  NULL,
    [AspNetUserRoles_RoleId] nvarchar(128)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [UserId], [RoleId] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [PK_AspNetUserRoles]
    PRIMARY KEY CLUSTERED ([UserId], [RoleId] ASC);
GO

-- Creating primary key on [Patient_Id] in table 'PatientSet'
ALTER TABLE [dbo].[PatientSet]
ADD CONSTRAINT [PK_PatientSet]
    PRIMARY KEY CLUSTERED ([Patient_Id] ASC);
GO

-- Creating primary key on [Doctor_Id] in table 'DoctorSet'
ALTER TABLE [dbo].[DoctorSet]
ADD CONSTRAINT [PK_DoctorSet]
    PRIMARY KEY CLUSTERED ([Doctor_Id] ASC);
GO

-- Creating primary key on [Booking_Id] in table 'BookingSet'
ALTER TABLE [dbo].[BookingSet]
ADD CONSTRAINT [PK_BookingSet]
    PRIMARY KEY CLUSTERED ([Booking_Id] ASC);
GO

-- Creating primary key on [Admin_Id] in table 'AdministratorSet'
ALTER TABLE [dbo].[AdministratorSet]
ADD CONSTRAINT [PK_AdministratorSet]
    PRIMARY KEY CLUSTERED ([Admin_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [AspNetUserRoles_UserId], [AspNetUserRoles_RoleId] in table 'PatientSet'
ALTER TABLE [dbo].[PatientSet]
ADD CONSTRAINT [FK_AspNetUserRolesPatient]
    FOREIGN KEY ([AspNetUserRoles_UserId], [AspNetUserRoles_RoleId])
    REFERENCES [dbo].[AspNetUserRoles]
        ([UserId], [RoleId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRolesPatient'
CREATE INDEX [IX_FK_AspNetUserRolesPatient]
ON [dbo].[PatientSet]
    ([AspNetUserRoles_UserId], [AspNetUserRoles_RoleId]);
GO

-- Creating foreign key on [AspNetUserRoles_UserId], [AspNetUserRoles_RoleId] in table 'DoctorSet'
ALTER TABLE [dbo].[DoctorSet]
ADD CONSTRAINT [FK_AspNetUserRolesDoctor]
    FOREIGN KEY ([AspNetUserRoles_UserId], [AspNetUserRoles_RoleId])
    REFERENCES [dbo].[AspNetUserRoles]
        ([UserId], [RoleId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRolesDoctor'
CREATE INDEX [IX_FK_AspNetUserRolesDoctor]
ON [dbo].[DoctorSet]
    ([AspNetUserRoles_UserId], [AspNetUserRoles_RoleId]);
GO

-- Creating foreign key on [AspNetUserRoles_UserId], [AspNetUserRoles_RoleId] in table 'AdministratorSet'
ALTER TABLE [dbo].[AdministratorSet]
ADD CONSTRAINT [FK_AspNetUserRolesAdministrator]
    FOREIGN KEY ([AspNetUserRoles_UserId], [AspNetUserRoles_RoleId])
    REFERENCES [dbo].[AspNetUserRoles]
        ([UserId], [RoleId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRolesAdministrator'
CREATE INDEX [IX_FK_AspNetUserRolesAdministrator]
ON [dbo].[AdministratorSet]
    ([AspNetUserRoles_UserId], [AspNetUserRoles_RoleId]);
GO

-- Creating foreign key on [DoctorDoctor_Id] in table 'BookingSet'
ALTER TABLE [dbo].[BookingSet]
ADD CONSTRAINT [FK_DoctorBooking]
    FOREIGN KEY ([DoctorDoctor_Id])
    REFERENCES [dbo].[DoctorSet]
        ([Doctor_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DoctorBooking'
CREATE INDEX [IX_FK_DoctorBooking]
ON [dbo].[BookingSet]
    ([DoctorDoctor_Id]);
GO

-- Creating foreign key on [PatientPatient_Id] in table 'BookingSet'
ALTER TABLE [dbo].[BookingSet]
ADD CONSTRAINT [FK_PatientBooking]
    FOREIGN KEY ([PatientPatient_Id])
    REFERENCES [dbo].[PatientSet]
        ([Patient_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PatientBooking'
CREATE INDEX [IX_FK_PatientBooking]
ON [dbo].[BookingSet]
    ([PatientPatient_Id]);
GO

-- Creating foreign key on [AdministratorAdmin_Id] in table 'BookingSet'
ALTER TABLE [dbo].[BookingSet]
ADD CONSTRAINT [FK_AdministratorBooking]
    FOREIGN KEY ([AdministratorAdmin_Id])
    REFERENCES [dbo].[AdministratorSet]
        ([Admin_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AdministratorBooking'
CREATE INDEX [IX_FK_AdministratorBooking]
ON [dbo].[BookingSet]
    ([AdministratorAdmin_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------