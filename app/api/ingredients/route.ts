import prisma from "@/prisma/prisma";
import { NextApiRequest, NextApiResponse } from "next";
import { NextResponse } from "next/server";

export async function GET(req: NextApiRequest, res: NextApiResponse) {
  try {
    const ingredients = await prisma.ingredient.findMany();
    return NextResponse.json(ingredients);
  } catch {
    return new NextResponse("Error");
  }
}

export async function POST() {}
