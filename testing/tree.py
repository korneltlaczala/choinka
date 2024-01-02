from turtle import *

def setup():
    
    # speed(10)
    tracer(False)
    lt(90)

def draw_triangle(size):

    color("green")


    pendown()
    begin_fill()
    rt(90)
    fd(size)
    lt(120)
    fd(size*2)
    lt(120)
    fd(size*2)
    lt(120)
    fd(size)
    lt(90)
    end_fill()
    penup()

def draw_rek_tree(size):
    print(size)
    if size < 20:
        return 

    rt(1)
    draw_triangle(size)

    fd(size)
    draw_rek_tree(size*3/4)

    rt(90)
    draw_rek_tree(size*3/4)

    lt(180)
    draw_rek_tree(size*3/4)
    rt(90)

    bk(size)

def draw_tree(size=100):
    draw_triangle(size)
    
    fd(size)
    draw_rek_tree(size*3/4)

if __name__ == "__main__":
    screen = Screen()
    penup()
    setup()
    draw_tree()
    done()