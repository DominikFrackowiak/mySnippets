-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Snippet" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    CONSTRAINT "Snippet_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Tag" (
    "id" TEXT NOT NULL PRIMARY KEY
);

-- CreateTable
CREATE TABLE "_SnippetToTag" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,
    CONSTRAINT "_SnippetToTag_A_fkey" FOREIGN KEY ("A") REFERENCES "Snippet" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_SnippetToTag_B_fkey" FOREIGN KEY ("B") REFERENCES "Tag" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Snippet_userId_key" ON "Snippet"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "_SnippetToTag_AB_unique" ON "_SnippetToTag"("A", "B");

-- CreateIndex
CREATE INDEX "_SnippetToTag_B_index" ON "_SnippetToTag"("B");
