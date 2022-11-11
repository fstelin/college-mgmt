from django.urls import path, include
import apis.views as api_view
from django.contrib import admin


urlpatterns = [
    path("details/", api_view.DetailsView.as_view()),
    path("attendance/", api_view.AttendancesView.as_view()),
    path("marks/", api_view.MarkView.as_view()),
    path("timetable/", api_view.TimetablesView.as_view()),
]
