package HTML::Formhandler::Role::ToJSON;

use Moose::Role;

sub prepare_error_response {  
  return +{
    form_errors => $_[0]->form_errors,
    error_by_field => $_[0]->errors_by_name,
    fields => $_[0]->fif,
  };
}

sub prepare_valid_response {
  return +{
    fields => $_[0]->fif,
  };
}

sub TO_JSON {
  my $self = shift;
  return $self->is_valid ?
    $self->prepare_valid_response :
      $self->prepare_error_response;
}

1;
