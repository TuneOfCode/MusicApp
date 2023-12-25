enum Paths {
  home,
  login,
  register,
  forgotPassword,
  explore,
  rank,
  profile,
  song,
  playlist,
}

const Map<Enum, String> routers = {
  Paths.home: '/',
  Paths.login: '/auth/login',
  Paths.register: '/auth/register',
  Paths.forgotPassword: 'auth/forgot-password',
  Paths.explore: '/explore',
  Paths.rank: '/rank',
  Paths.profile: '/profile',
  Paths.song: '/song',
  Paths.playlist: '/playlist',
};
