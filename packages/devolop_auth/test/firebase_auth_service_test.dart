void main() {
  test('signs in a user successfully', () async {
    final service = MockFirebaseAuthService();
    when(service.signIn(any, any)).thenAnswer((_) =>
        Future.value(UserModel(id: '1', email: 'email', username: 'username')));

    final result = await service.signIn('email', 'password');

    expect(result, isNotNull);
    expect(result.id, '1');
  });
}
