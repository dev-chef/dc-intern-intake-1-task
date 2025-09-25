-- CreateTable
CREATE TABLE "MentorProfile" (
    "userId" TEXT NOT NULL PRIMARY KEY,
    "bio" TEXT,
    "rating" REAL
);

-- CreateTable
CREATE TABLE "MenteeProfile" (
    "userId" TEXT NOT NULL PRIMARY KEY
);

-- CreateTable
CREATE TABLE "AvailabilitySlot" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "mentorId" TEXT NOT NULL,
    "start" DATETIME NOT NULL,
    "end" DATETIME NOT NULL,
    CONSTRAINT "AvailabilitySlot_mentorId_fkey" FOREIGN KEY ("mentorId") REFERENCES "MentorProfile" ("userId") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Booking" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "menteeId" TEXT NOT NULL,
    "mentorId" TEXT NOT NULL,
    "date" DATETIME NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'PENDING',
    CONSTRAINT "Booking_menteeId_fkey" FOREIGN KEY ("menteeId") REFERENCES "MenteeProfile" ("userId") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Booking_mentorId_fkey" FOREIGN KEY ("mentorId") REFERENCES "MentorProfile" ("userId") ON DELETE RESTRICT ON UPDATE CASCADE
);
