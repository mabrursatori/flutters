part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer.run(() async {
      user = await SharedPref.getSession();
      if (wallet != null) {
        context.bloc<PageBloc>().add(GoToTopUpPage(GoToMainPage()));
      } else if (user != null) {
        tickets = await SharedPref.getTickets(user.name);
        context.bloc<UserBloc>().add(LoadUser());
        context.bloc<PageBloc>().add(GoToMainPage());
        context.bloc<TicketBloc>().add(GetTickets(user.name));
      } else if (login != null) {
        context.bloc<PageBloc>().add(GoToRegistrationPage(RegistrationData()));
      } else if (signin != null) {
        context.bloc<PageBloc>().add(GoToLoginPage());
      } else {
        context.bloc<PageBloc>().add(GoToSplashPage());
      }
    });

    return BlocBuilder<PageBloc, PageState>(
      builder: (_, pageState) => (pageState is OnSplashPage)
          ? SplashPage()
          : (pageState is OnLoginPage)
              ? SignInPage()
              : (pageState is OnRegistrationPage)
                  ? SignUpPage(pageState.registrationData)
                  : (pageState is OnPreferencePage)
                      ? PreferencePage(pageState.registrationData)
                      : (pageState is OnAccountConfirmationPage)
                          ? AccountConfirmationPage(pageState.registrationData)
                          : (pageState is OnMovieDetailPage)
                              ? MovieDetailPage(pageState.movie,
                                  isBooked: pageState.isBooked)
                              : (pageState is OnSelectSchedulePage)
                                  ? SelectSchedulePage(pageState.movieDetail)
                                  : (pageState is OnSelectSeatPage)
                                      ? SelectSeatPage(pageState.ticket)
                                      : (pageState is OnCheckoutPage)
                                          ? CheckoutPage(pageState.ticket)
                                          : (pageState is OnSuccessPage)
                                              ? SuccessPage(pageState.ticket,
                                                  pageState.transaction)
                                              : (pageState
                                                      is OnTicketDetailPage)
                                                  ? TicketDetailPage(
                                                      pageState.ticket)
                                                  : (pageState is OnProfilePage)
                                                      ? ProfilePage()
                                                      : (pageState
                                                              is OnTopUpPage)
                                                          ? TopUpPage(pageState
                                                              .pageEvent)
                                                          : (pageState
                                                                  is OnWalletPage)
                                                              ? WalletPage(
                                                                  pageState
                                                                      .pageEvent)
                                                              : (pageState
                                                                      is OnEditProfilePage)
                                                                  ? EditProfilePage(
                                                                      pageState
                                                                          .user)
                                                                  : (pageState
                                                                          is OnMainPage)
                                                                      ? MainPage(
                                                                          bottomNavBarIndex:
                                                                              pageState.bottomNavBarIndex,
                                                                          isExpired:
                                                                              pageState.isExpired,
                                                                        )
                                                                      : BlankPage(),
    );
  }
}
