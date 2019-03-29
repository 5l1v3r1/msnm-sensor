from django.urls import path

from . import views

app_name = 'mainboard'
urlpatterns = [
    # Example: path('getsentences/', views.GetSentencesView.as_view(), name='get_sentences'),
    path('', views.MainView.as_view(), name='main'),
    path('graph/<slug:sid>', views.GraphView.as_view(), name='graph'),
]