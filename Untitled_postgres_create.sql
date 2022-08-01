CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" varchar(30) NOT NULL,
	"address" varchar(30) NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"imageId" integer NOT NULL UNIQUE,
	"price" integer NOT NULL,
	"categoryId" integer NOT NULL,
	"sizeId" integer NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products_photos" (
	"id" serial NOT NULL,
	"url_img" serial NOT NULL UNIQUE,
	CONSTRAINT "products_photos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.category" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "category_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.size" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "size_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.shopping" (
	"id" serial NOT NULL,
	"userId" serial NOT NULL,
	"productId" serial NOT NULL,
	"dateStart" DATE NOT NULL,
	"created" BOOLEAN NOT NULL,
	"payed" BOOLEAN,
	"delivered" BOOLEAN,
	"finished" BOOLEAN,
	"dateEnd" DATE,
	"address" DATE,
	CONSTRAINT "shopping_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.address" (
	"id" serial NOT NULL,
	"city" TEXT NOT NULL,
	"state" TEXT NOT NULL,
	"country" TEXT NOT NULL,
	"street" TEXT NOT NULL,
	"district" TEXT NOT NULL,
	CONSTRAINT "address_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "users" ADD CONSTRAINT "users_fk0" FOREIGN KEY ("address") REFERENCES "address"("id");

ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("imageId") REFERENCES "products_photos"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("categoryId") REFERENCES "category"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk2" FOREIGN KEY ("sizeId") REFERENCES "size"("id");




ALTER TABLE "shopping" ADD CONSTRAINT "shopping_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");
ALTER TABLE "shopping" ADD CONSTRAINT "shopping_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "shopping" ADD CONSTRAINT "shopping_fk2" FOREIGN KEY ("address") REFERENCES "address"("id");









