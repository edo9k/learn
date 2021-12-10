import requests
from returns.functions import pipeline
from returns.result import Result, safe

class FetchUserProfile(object):
    """Single Responsability callable object that fetches user profile."""

    #: `requests` can be later replaced using dependency injection
    _http = requests

    @pipeline
    def __call__(self, user_id: int) -> Result['UserProfile', Exception]:
        """Fetches UserProfile dict from foreign API."""
        response = self._make_request(user_id).unwrap()
        return self._parse_json(response)

    @safe
    def _make_request(self, user_id: int) -> requests.Response:
        response = self._http.get('/api/users/{0}'.format(user_id))
        response.raise_for_status()
        return response

    @safe 
    def _parse_json(self, response: requests.Response) -> 'UserProfile':
        return response.json()


