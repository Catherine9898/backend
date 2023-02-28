defmodule Cadet.Notifications.NotificationPreference do
  @moduledoc """
  NotificationPreference entity that stores user preferences for a specific notification for a specific course/assessment.
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias Cadet.Notifications.{NotificationConfig, TimeOption}
  alias Cadet.Accounts.CourseRegistration

  schema "notification_preferences" do
    field(:is_enabled, :boolean, default: false)

    belongs_to(:notification_config, NotificationConfig)
    belongs_to(:time_option, TimeOption)
    belongs_to(:course_reg, CourseRegistration)

    timestamps()
  end

  @doc false
  def changeset(notification_preference, attrs) do
    notification_preference
    |> cast(attrs, [:is_enabled, :notification_config_id, :course_reg_id])
    |> validate_required([:notification_config_id, :course_reg_id])
  end
end
