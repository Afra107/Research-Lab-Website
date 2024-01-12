from flask import Flask, Blueprint, render_template
from . import models

views = Blueprint("view",__name__, "base")

@views.route('/')
def start():
    return render_template("dashboard.html")

@views.route('/home')
def home():
    return render_template("dashboard.html")

headings1 = ("No.", "Title", "Start Date")

@views.route('/projects')
def projects():
    return render_template("projects.html", headings1 = headings1, viewtuple1 = models.viewtuple1)


headings = ("No.", "Title")

@views.route('/publications')
def publications():
    return render_template("publication.html", headings = headings, dict = models.dict)



headings2 = ("Assistant Id", "Name", "Researcher Name")

headings3 = ("Student Id", "Name", "Researcher Name")
headings4 = ("Alumni Id", "Name", "Researcher Name")
@views.route('/team')
def team():
    return render_template("people.html", headings2 = headings2, stu_tuple = models.stu_tuple, headings3 = headings3, headings4 = headings4, alu_tuple = models.alu_tuple)


@views.route('/news-events')
def news_events():
    return render_template("news-events.html")


@views.route('/datasets')
def datasets():
    return render_template("datasets.html")


#@views.route('/more-info')
#def more_info():
 #   return render_template("component.html")


@views.route('/jobs')
def jobs():
    return render_template("jobs.html")
