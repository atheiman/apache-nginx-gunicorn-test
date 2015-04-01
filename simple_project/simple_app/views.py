from django.http import HttpResponse

def current_datetime(request):
    html = """<html><body>Django answers the call to url <code>{}</code>.
</body></html>""".format(request.build_absolute_uri())
    return HttpResponse(html)
